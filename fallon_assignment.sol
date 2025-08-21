// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the ERC20 contract from OpenZeppelin to use standard token functionalities
// ERC20 provides the basic structure and functions for a standard token
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Import the Ownable contract from OpenZeppelin to add access control to the contract
// Ownable provides a basic ownership structure where the owner has special privileges
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleToken is ERC20, Ownable {
    // Constructor: Sets up the token with a name, symbol, and initial supply
    // Also sets the owner of the contract to the person who deployed it
    constructor(uint256 initialSupply) ERC20("SimpleToken", "ST") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply); // Create the initial tokens and send them to the contract owner
    }

    // Function to create new tokens and send them to a specific address
    // Only the owner of the contract can call this function
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); // Create the new tokens and send them to the specified address
    }

    // Function to send tokens from the sender's address to another address
    // Returns true if the transfer was successful
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), to, amount); // Handle the transfer logic
        return true; // Return success status
    }
}
