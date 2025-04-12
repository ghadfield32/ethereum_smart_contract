// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint256) private balances;
    event DepositMade(address indexed accountAddress, uint amount);
    event WithdrawalMade(address indexed accountAddress, uint amount);

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit DepositMade(msg.sender, msg.value);
    }

    function withdraw(uint256 withdrawAmount) public {
        require(balances[msg.sender] >= withdrawAmount, "Insufficient balance");
        balances[msg.sender] -= withdrawAmount;
        payable(msg.sender).transfer(withdrawAmount);
        emit WithdrawalMade(msg.sender, withdrawAmount);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
