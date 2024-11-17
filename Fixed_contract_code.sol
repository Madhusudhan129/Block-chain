// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract DWG {
 mapping(address => uint256) private balances;

 event Deposit(address indexed user, uint256 amount);
 event Withdraw(address indexed user, uint256 amount);
 function deposit() public payable {

 require(msg.value > 0, "Deposit amount must be greater than zero.");
 balances[msg.sender] += msg.value;

 emit Deposit(msg.sender, msg.value);
 }

 function withdraw(uint256 amount) public {
 uint256 balance = balances[msg.sender];
 require(amount > 0, "Withdraw amount must be greater than zero.");
 require(amount <= balance, "Insufficient balance.");

 balances[msg.sender] -= amount;
 payable(msg.sender).transfer(amount);

 emit Withdraw(msg.sender, amount);
 }

 function getBalance() public view returns (uint256) {
 return balances[msg.sender];
 }
}
