// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract BankAccount {
    mapping(address => uint256) private balances;

    // Deposit Ether into your account
    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    // Withdraw Ether from your account
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Check your account balance
    function showBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
