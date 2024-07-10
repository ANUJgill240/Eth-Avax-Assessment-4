# Degen token verification using fuji network
The DegenTokens smart contract creates a custom ERC20 token on the Avalanche blockchain. It allows the owner to mint and reward tokens, track player rewards, facilitate player-to-player trading, and redeem tokens for in-game rewards. This enhances player engagement and loyalty within the Degen Gaming ecosystem.

## Description
In this we are verifying the smart contract using fuji network and snowtrace to tract the activity of the account of metamask

### procedure
*open remix and write a smart contract of degen tokens

*now connect that smart contract to a metamask account selecting inject with metamask wallet

*copy the address and paste it on snowtrace

*it will show the activity of the smart contract connected with wallet

*it will always ask for the cost and permission deploying and doing things

### Executing program
---solidity

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
    
## Authors
Anuj

Anujgill240@gmail.com

## License
This project is licensed under the MIT License
