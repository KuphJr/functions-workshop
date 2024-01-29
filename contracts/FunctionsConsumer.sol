// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {FunctionsClient} from "@chainlink/contracts/src/v0.8/functions/dev/v1_0_0/FunctionsClient.sol";
import {ConfirmedOwner} from "@chainlink/contracts/src/v0.8/shared/access/ConfirmedOwner.sol";
import {FunctionsRequest} from "@chainlink/contracts/src/v0.8/functions/dev/v1_0_0/libraries/FunctionsRequest.sol";

/**
 * @title Chainlink Functions example on-demand consumer contract example
 */
contract FunctionsConsumer is FunctionsClient, ConfirmedOwner {
  using FunctionsRequest for FunctionsRequest.Request;

  uint32 constant CALLBACK_GAS_LIMIT = 300000; // Maximum about of gas which can be used for request fulfillment

  bytes32 public s_donId; // DON ID for the Functions DON to which the requests are sent

  string public s_javascriptCode; // JavaScript code which will be executed during Functions request
  uint64 public s_subscriptionId; // Functions subscription ID used to pay for requests

  bytes32 public s_lastSentRequestId; // Functions request ID of the latest request
  bytes32 public s_lastReceivedRequestId; // Functions request ID of the latest response
  bytes public s_lastResponse; // Latest Functions response represented as raw bytes
  string public s_lastError; // Latest Functions request error message

  constructor(address router, bytes32 donId) FunctionsClient(router) ConfirmedOwner(msg.sender) {
    s_donId = donId;
  }

  function setRequest(uint64 subscriptionId, string calldata javascriptCode) external onlyOwner {
    s_javascriptCode = javascriptCode;
    s_subscriptionId = subscriptionId;
  }

  /**
   * @notice Triggers an on-demand Functions request
   * @param args Array of string arguments passed into the source code which are accessible via the global variable `args`
   */
  function sendRequest(string[] calldata args) external onlyOwner {
    FunctionsRequest.Request memory req;
    req.initializeRequestForInlineJavaScript(s_javascriptCode);
    if (args.length > 0) {
      req.setArgs(args);
    }
    s_lastSentRequestId = _sendRequest(req.encodeCBOR(), s_subscriptionId, CALLBACK_GAS_LIMIT, s_donId);
  }

  /**
   * @notice Store latest result/error
   * @param requestId The request ID, returned by sendRequest()
   * @param response Aggregated response from the JavaScript code
   * @param err Aggregated error from the JavaScript code or from the execution pipeline
   * Either response or error parameter will be set, but never both
   */
  function fulfillRequest(bytes32 requestId, bytes memory response, bytes memory err) internal override {
    s_lastReceivedRequestId = requestId;
    s_lastResponse = response;
    s_lastError = string(err);
  }
}
