const { mnemonic, etherscanApiKey } = require("./secrets.json");

require("@nomiclabs/hardhat-waffle");
require('@nomiclabs/hardhat-ethers');
require("@nomiclabs/hardhat-etherscan");

module.exports = {
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  networks: {
    hardhat: {},
    goerli: {
      url: "",
      chainId: 5,
      accounts: { mnemonic },
    },
  },
  etherscan: {
    apiKey: etherscanApiKey    // EtherscanでVerifyする場合
  }
};