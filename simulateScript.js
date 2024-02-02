const { simulateScript, decodeResult } = require('@chainlink/functions-toolkit')

;(async () => {
  // Replace this value with your desired JavaScript source code
  const source = 'console.log("hi"); return Functions.encodeString(args[0])'
  // Replace this with your desired args
  const args = ['hello world']
  // Replace this with your desired secrets
  const secrets = {
    API_KEY: process.env.API_KEY,
  }
  // Replace this with your expected response type
  const responseType = 'string'

  const result = await simulateScript({
    source,
    args,
    secrets,
  })

  if (result.capturedTerminalOutput.length > 0) {
    console.log(result.capturedTerminalOutput)
  }

  if (result.errorString) {
    throw Error(result.errorString)
  }

  if (result.responseBytesHexstring) {
    const decodedResult = decodeResult(result.responseBytesHexstring, responseType)
    console.log(`Decoded Result: ${decodedResult}`)
  }
})()
