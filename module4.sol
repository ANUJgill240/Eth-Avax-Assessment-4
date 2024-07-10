  // SPDX-License-Identifier: MIT
 // Compatible with OpenZeppelin Contracts ^5.0.0
 pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenTokens is ERC20, ERC20Burnable, Ownable {
// Mapping to keep track of rewards for each player
mapping(address => uint256) private rewards;

constructor()
    ERC20("DegenTokens", "DGN")
    Ownable(msg.sender)
{}

// Function to mint new tokens, only callable by the owner
function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}

// Function to reward players, only callable by the owner
function rewardPlayer(address player, uint256 amount) public onlyOwner {
    rewards[player] += amount;
    _mint(player, amount);
}

// Function to get the reward balance of a player
function getRewardBalance(address player) public view returns (uint256) {
    return rewards[player];
}

// Function to allow players to trade tokens
function trade(address to, uint256 amount) public {
    _transfer(msg.sender, to, amount);
}

// Function to redeem rewards (for example, in the in-game store)
function redeem(address player, uint256 amount) public onlyOwner {
    require(rewards[player] >= amount, "Insufficient reward balance");
    rewards[player] -= amount;
    _burn(player, amount);
}}
