// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract DWG {
 // Mapping to store user balances
 mapping(address => uint256) private balances;
 // Event emitted when a deposit is made
 event Deposit(address indexed user, uint256 amount);
 // Event emitted when a withdrawal is made
 event Withdraw(address indexed user, uint256 amount);
 // Deposit function to add funds to the contract
 function deposit() public payable {
 require(msg.value > 0, "Deposit amount must be greater than zero.");
 balances[msg.sender] += msg.value;

 emit Deposit(msg.sender, msg.value); // Emit deposit event
 }

 // Withdraw function with security improvements
 function withdraw(uint256 amount) public {
 uint256 balance = balances[msg.sender];
 require(amount > 0, "Withdraw amount must be greater than zero.");
 require(amount <= balance, "Insufficient balance."); // Ensure enough balance

 balances[msg.sender] -= amount; // Update balance before transfer
 payable(msg.sender).transfer(amount); // Transfer the funds

 emit Withdraw(msg.sender, amount); // Emit withdrawal event
 }

 // Function to check the balance of the sender
 function getBalance() public view returns (uint256) {
 return balances[msg.sender];
 }
}
