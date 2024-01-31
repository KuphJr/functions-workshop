# Functions Workshop

## Phase 1 Prerequisites

To complete Phase 1 of the workshop, you will need to have MetaMask or a similar wallet installed in your browser.
You must also have testnet LINK tokens as well as funds to cover transaction gas costs.
You can aquire testnet LINK and gas funds at [https://faucets.chain.link/](https://faucets.chain.link/)

You can follow this tutorial on all testnet chains which Functions currently supports:
`Ethereum Sepolia`, `Polygon Mumbai`, `Avalanche Fuji`, or `Arbitrum Sepolia`

## Phase 1 Instructions

1. Open the Remix editor at [https://remix.ethereum.org/](https://remix.ethereum.org) and create a new blank workspace
2. Load the `/contract/FunctionsConsumer.sol` Solidity contract into Remix using the Github URL `https://github.com/KuphJr/functions-workshop/blob/main/contracts/FunctionsConsumer.sol`
3. Set the Don ID & router address
4. Deploy the contract to a testnet blockchain that Functions supports, providing the Functions router contract address and DON ID hex string for the given blockchain which can be found [here](https://docs.chain.link/chainlink-functions/supported-networks)
5. Create a Chainlink Functions subscription at [https://functions.chain.link/](https://functions.chain.link/), add the Functions consumer contract address, and fund the subscription with LINK.
6. Set the subscription ID via Remix using `setSubscriptionId`
7. Set the JavaScript code for the Functions request using `setJavascriptCode`
8. Send a Functions request using `sendRequest` and providing any necessary request arguments in the format `["myArgument1","myArgument2"]`
9. View the Functions request status from the Functions subscription page
10. View the request response (or error) with Remix using `s_lastResponse` (or `s_lastError`)

## Phase 2 Prerequisites

For Pase 2, you must have [Node.js](https://nodejs.org/en) installed.
Additionally, you can also install [Deno](https://deno.com/) for local simulation (optional).

You also must aquire an API token from 

Load the file /contracts/FunctionsConsumer.sol into Remix
