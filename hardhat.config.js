const { task } = require('hardhat/config')

// require('@nomiclabs/hardhat-etherscan')
require('@nomiclabs/hardhat-waffle')
require('dotenv').config()



// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks: {
    hardhat: {  /// [Note]: This network is for executing test with mainnet-fork approach
      forking: {
        url: `https://eth-mainnet.alchemyapi.io/v2/${process.env.ALCHEMY_KEY}`,
        blockNumber: 11589707    
      }
    },
    velas_testnet: {
      url: `https://explorer.testnet.velas.com/rpc`,
      //accounts: [process.env.RINKEBY_PRIVKEY]
    },
    // rinkeby: {
    //   url: `https://eth-rinkeby.alchemyapi.io/v2/${process.env.ALCHEMY_KEY}`,
    //   accounts: [process.env.RINKEBY_PRIVKEY]
    // },
    // live: {
    //   url: `https://eth-mainnet.alchemyapi.io/v2/${process.env.ALCHEMY_KEY}`,
    //   accounts: [process.env.MAINNET_PRIVKEY]
    // }
  },
  // etherscan: {
  //   apiKey: process.env.ETHERSCAN_API_KEY
  // },

  solidity: {
    compilers: [
      {
        version: '0.7.6'
      },
      {
        version: '0.8.0'
      }
    ]
  }
}
