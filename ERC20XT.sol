// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ERC20.sol"; //imported the ERC20 code
 
contract ERC20 is IERC20{ //we inherit the values of the Ierc20 contract
 
uint public override totalSupply;// override allows the use of two names in the same contract
mapping(address => uint) public override balanceOf; //mapping the adress of balanceof
mapping(address => mapping(address => uint)) public override allowance; //used to keep track of token approvals. 
string public name ="Tech4dev"; //we declare a string name of the token
string public symbol ="T4D"; //we declare a string symbol of the token
uint public decimals = 18; //we declare an integer that takes decimal that how divisible a token can be
 
function transfer(address recipient, uint amount) external override returns(bool){
balanceOf[msg.sender] -= amount; //method 1 is deducting the amount from sender's balance
balanceOf[recipient] += amount; //method 2 is adding amount to recipient's balance
 
emit Transfer(msg.sender, recipient, amount); //show something to the recip
return true; //function will work if its true
}
 
function approve(address spender, uint amount) external override returns(bool){ // it aprroves the transaction
allowance[msg.sender][spender] = amount; //it runs before aprrove fuction
emit Approval(msg.sender, spender, amount); //it shows the address to the recip
return true; //function will work if its true
}
 
function transferFrom(address sender, address recipient, uint amount) external override returns(bool){ //enable tokes to be transfered
allowance[sender][msg.sender] -= amount; //used to keep track of token approvals. 
balanceOf[sender] -= amount; //method 1 is deducting the amount from sender's balance
balanceOf[recipient] += amount; //method 2 is adding amount to recipient's balance
emit Transfer(sender, recipient, amount); //shows the adress tranfer to the recip
return true; //function will work if its true
}
 
}