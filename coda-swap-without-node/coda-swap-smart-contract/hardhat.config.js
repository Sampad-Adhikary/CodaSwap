require('@nomiclabs/hardhat-waffle');
const fs = require('fs');
const privateKey = fs.readFileSync(".secret").toString().trim();

module.exports = {
  networks: {
    ganache: {
      url: 'http://127.0.0.1:8545',
      accounts: ["0x8c4fdc5e9b1d77d1b22136c65106a7d626c0c5823148701fe48c7542acd8c2e8",],
    },
  },
  solidity: "0.8.0",
};

