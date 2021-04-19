//***Events***//

/* EVM saves events inside its log structure within the data structure, 
therefore we can add eventlog of any function to the EVM log structure to know later what was done on the contract.*/

pragma solidity 0.7.5;

contract Bank {
    mapping(address => uint) balance;
    address owner;
    
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
    
    event balanceAdded (uint amount, address indexed depositedTo);
    //creating the events log of addBalance function with two parameters (amount & address)
    /*indexed will help to index the parameters in order to search through it in the future.
      we can index maximum 3 parameters for each event*/
    
    constructor() {
        owner = msg.sender;
    } 
    
    function addBalance(uint _toAdd) public onlyOwner returns (uint) {

        balance[msg.sender] += _toAdd;
        emit balanceAdded (_toAdd, msg.sender);
        /*calling the log event for addBalance function inside it after adding balance statment,
        in order to record the action*/        
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


