// Importing the Hardhat Runtime Environment (HRE) module
const hre = require("hardhat");

// Asynchronous function for deploying the token contract
async function main() {
  // Get the contract factory for the "Token" contract
  const Token = await hre.ethers.getContractFactory("Token");
  
  // Deploy the token contract
  const token = await Token.deploy();
  
  // Wait for the deployment transaction to be confirmed
  await token.deployed();
  
  // Print the deployed contract's address
  console.log("Token deployed to:", token.address);
}

// Calling the main function to initiate the deployment
main();
