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
3. Compile & deploy the contract to a testnet blockchain that Functions supports, providing the Functions router contract address and DON ID hex string for the given blockchain which can be found [here](https://docs.chain.link/chainlink-functions/supported-networks)
4. Create a Chainlink Functions subscription at [https://functions.chain.link/](https://functions.chain.link), add the Functions consumer contract address, and fund the subscription with LINK.
5. Set the subscription ID via Remix using `setSubscriptionId`
6. Set the JavaScript code string for the Functions request using `setJavascriptCode` using code from [this Functions Playground example](https://functions.chain.link/playground/823d75ac-1ef6-4792-bbb5-e8f484733791)
7. Send a Functions request using `sendRequest` and providing a city in the request arguments array (ex: `["New-York"]`)
8. View the Functions request status from the Functions subscription page to see when it is fulfilled
9. View the request response (or error) stored in your contract with Remix using `s_lastResponse` (or `s_lastError`)
10. Decode the response bytes hex string using a hex decoder tool such as [this](https://onlinetools.com/utf8/convert-hexadecimal-to-utf8)

## Phase 2 Prerequisites

For Pase 2, you must have [Node.js](https://nodejs.org/en) installed.
Additionally, you can also install [Deno](https://deno.com/) for local simulation (optional).

You also must aquire an RPC URL for your desired blockchain from [www.infura.io](https://www.infura.io/) (or similar) and a soccer free trial API token from [sportsdata.io](https://sportsdata.io/).

## Phase 2 Instructions

1. Copy the JavaScript file `/encryptAndUploadSecrets.js` to a file on your local machine
2. In the same directory as the JavaScript file, run `npm install ethers@5.7.2` and `npm install @chainlink/functions-toolkit`
3. Modify `encryptAndUploadSecrets.js` for your given network as described by the code comments
4. Set the `PRIVATE_KEY` environment variable to the private key you used to create your Functions subscription, the `API_KEY` environment variable to your API key, and the `RPC_URL` environment variable to your RPC URL
5. Run the script file with Node.js by running `node /path/to/your/file/encryptAndUpload.js`
6. Set the resulting encrypted secrets hex string in your smart contract via Remix using `setEncryptedSecretsReference`
7. Set the JavaScript code using code from [this Functions Playground example](https://functions.chain.link/playground/4801545f-4055-4c45-8d6c-717a96a21038) using `setJavaScriptCode`
8. Send the request using the arguments (ex: `["2023-01-28", "VEN/GUA"]`) and observe the results similar to Phase 1
9. (Optional) The Functions Playground runs in your browser and does not perfectly represent the actual Functions execution environment used for on-chain requests. To simulate the source code on your local machine for better debugging, see the file `/simulateScript.js` (this requires Deno to be installed)
