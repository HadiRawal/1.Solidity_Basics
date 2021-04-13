pragma solidity 0.7.5;

contract HelloWorld {
    mapping(address => uint) balance;
    
    function addBalance (uint _toAdd) public returns (uint){
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    
}