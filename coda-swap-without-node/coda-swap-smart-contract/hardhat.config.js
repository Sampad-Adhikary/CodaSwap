// Importing the required package for using the Hardhat development environment
require('@nomiclabs/hardhat-waffle');
// Importing the built-in 'fs' module for file system operations
const fs = require('fs');

// Reading the Ethereum private key from the '.secret' file
const privateKey = fs.readFileSync(".secret").toString().trim();

// Exporting the configuration settings for the Hardhat environment
module.exports = {
  // Network configurations for different networks
  networks: {
    // Configuration for the Ganache local Ethereum network
    ganache: {
      // URL of the Ganache local node
      url: 'http://127.0.0.1:8545',
      // List of Ethereum accounts associated with the Ganache network
      accounts: ["0x8c4fdc5e9b1d77d1b22136c65106a7d626c0c5823148701fe48c7542acd8c2e8",],
    },
  },
  // Solidity compiler version setting
  solidity: "0.8.0",
};

