// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing necessary contracts from the OpenZeppelin library
import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; // ERC20 token implementation
import "@openzeppelin/contracts/access/Ownable.sol"; // Ownership functionality

// Defining the main contract 'Token' that inherits from ERC20 and Ownable
contract Token is ERC20, Ownable {
    // Constructor function: Initializes the token with a name and symbol
    constructor() ERC20("Coda Token", "CODA") {
        // Mint initial supply of tokens to the contract deployer
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Function to exchange Ether (ETH) for tokens
    function sendEthForTokens() external payable {
        // Require that the sent Ether amount is greater than 0
        require(msg.value > 0, "Must send some ETH");

        // Calculate the amount of tokens to mint based on the sent Ether (conversion rate to be replaced)
        uint256 tokenAmount = msg.value * 10; // Replace with your conversion rate
        _mint(msg.sender, tokenAmount); // Mint tokens to the sender
    }

    // Function to check the token balance of a given address
    function checkTokenBalance(address account) external view returns (uint256) {
        return balanceOf(account); // Return the token balance of the specified account
    }

    // Function to transfer tokens from the sender's account to another address
    function transferTokens(address to, uint256 amount) external returns (bool) {
        // Require that the amount to be transferred is greater than 0
        require(amount > 0, "Amount must be greater than 0");
        // Require that the sender has sufficient balance
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        // Transfer tokens from the sender to the specified recipient
        _transfer(msg.sender, to, amount);
        return true; // Return a success flag
    }

    // Function to exchange tokens for Ether and receive a percentage of Ether back
    function getEthBack(uint256 tokenAmount) external {
        // Require that the token amount to be exchanged is greater than 0
        require(tokenAmount > 0, "Token amount must be greater than 0");
        // Require that the sender has sufficient balance
        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient balance");

        // Burn (destroy) the specified amount of tokens from the sender's account
        _burn(msg.sender, tokenAmount);
        // Transfer a percentage (1%) of the token amount as Ether back to the sender
        payable(msg.sender).transfer(tokenAmount / 100); // Sending 1% of tokenAmount as ETH
    }
}
