// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    constructor() ERC20("Coda Token", "CODA") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function sendEthForTokens() external payable {
        require(msg.value > 0, "Must send some ETH");

        uint256 tokenAmount = msg.value * 10; // Replace with your conversion rate
        _mint(msg.sender, tokenAmount);
    }

    function checkTokenBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    function transferTokens(address to, uint256 amount) external returns (bool) {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _transfer(msg.sender, to, amount);
        return true;
    }

    function getEthBack(uint256 tokenAmount) external {
        require(tokenAmount > 0, "Token amount must be greater than 0");
        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient balance");

        _burn(msg.sender, tokenAmount);
        payable(msg.sender).transfer(tokenAmount / 100); // Sending 1% of tokenAmount as ETH
    }
}

