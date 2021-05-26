//***Inheritance***//
/*In Inheritance we have two contracts the child and the parent, always the child will inherint from the parent
There are two ways to inherit from the parent contract:
1. If the two contracts in one file : In the child contract we need to add a keywords [is (parent contract name)]  
2. If the two contracts are separtaed in to files: we need to import the parent file on the child file
    with import "./parentContractName.sol" and adding the keywords [is (parent contract name)] after the child name */ 

pragma solidity 0.7.5;

import "./Ownable.sol";     //importing if the parent contract is in other file.

contract Ownable {
     address owner;
     
     constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
    require (msg.sender == owner);
    _;
    }
}


contract Bank is Ownable { //declaring that the bank contract is a child of Ownable (Inheritance)
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
        
        assert(balance[msg.sender] == previousSenderBalance - amount); 

    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;     
    }
    
}


