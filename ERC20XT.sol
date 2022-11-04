// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ERC20.sol";
 
contract ERC20 is IERC20{
 
uint public override totalSupply;
mapping(address => uint) public override balanceOf;
mapping(address => mapping(address => uint)) public override allowance;
string public name ="Mike Token";
string public symbol ="MKT";
uint public decimals = 18;
 
function transfer(address recipient, uint amount) external override returns(bool){
balanceOf[msg.sender] -= amount; //method 1 is deducting the amount from sender's balance
balanceOf[recipient] += amount; //method 2 is adding amount to recipient's balance
 
emit Transfer(msg.sender, recipient, amount);
return true;
}
 
function approve(address spender, uint amount) external override returns(bool){
allowance[msg.sender][spender] = amount;
emit Approval(msg.sender, spender, amount);
return true;
}
 
function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
allowance[sender][msg.sender] -= amount; 
balanceOf[sender] -= amount;
balanceOf[recipient] += amount;
emit Transfer(sender, recipient, amount);
return true;
}
 
}