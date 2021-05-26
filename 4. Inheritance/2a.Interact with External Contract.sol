/***Intract with External Contract***/

pragma solidity 0.7.5;

import "./Ownable.sol";  

/* To integrate the external contract inside or contract we need :*/

//1. to know what the contract's function is: therefore we need interface as below declaring the function header.
interface GovermentInterface{
    function addTransaction(address _from, address _to, uint _amount) external;
}


contract Bank is Ownable {
    
//2. to know where is the contract located:                          External Contract Address 
    GovermentInterface govermentLocation = GovermentInterface(0x8B801270f3e02eA2AACCf134333D5E5A019eFf42);
    
    mapping(address => uint) balance;

    event depositDone (uint amount, address indexed depositedTo);

    function deposit() public payable returns (uint) {

        balance[msg.sender] += msg.value;
        emit depositDone (msg.value, msg.sender);
        return balance[msg.sender];
    }
    
    function withdraw(uint amount) public onlyOwner returns (uint){

        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >=amount, "Balance is not sufficient!");
        require(msg.sender != recipient, "Dont traansfer fund to yourself!");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
//3. Calling the external contract function inside our targeted function   
        govermentLocation.addTransaction (msg.sender, recipient, amount);
        
        assert(balance[msg.sender] == previousSenderBalance - amount); 

    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;    
    }
    
    function contractBalance() public view returns(uint){
        return address(this).balance; 
    }
    
}


