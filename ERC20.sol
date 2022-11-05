// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 
interface IERC20{
    function totalSupply() external view returns(uint); // Indicates the total amount of tokes created and returns an integer 
    function balanceOf(address account) external view returns(uint); // function balanceof when called, indicates the remaining tokes in the wallet
    function transfer(address recipient, uint amount) external returns(bool); // permites money to be transfered
    function allowance(address owner, address spender) external view returns(uint); //returns the token amount remaining
    function approve(address spender, uint amount) external returns(bool); //it aprroves the tranferform to happenn
    function transferFrom(address sender, address recipient, uint amount) external returns(bool); //its called by the person who wants to transfer the tokes
 
event Transfer(address indexed from, address indexed to, uint amount); //input the adress
event Approval(address indexed owner, address indexed spender, uint amount); //the spender aproval
 
}