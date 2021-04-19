//***REQUIRE, ASSERT & MODIFIER***// 

/*Modifier: is used to separate logic and reuse that repeatedly used in many place in our code.
            it runs on the top of function, before excuting this function to check if the condition is valid or not.*/
           
pragma solidity 0.7.5;

contract Bank {
    mapping(address => uint) balance;
    address owner;
    
    //modifier is used to avoid the repetition of a logic check throughout the code
    modifier onlyOwner {
        // LOGIC (Condition) = restrict adding balance function (only the owner can execute it)
        require (msg.sender == owner);
        _; // "_" means run the function
    }
    
    constructor() {
        owner = msg.sender;
    } 
    
    function addBalance(uint _toAdd) public onlyOwner returns (uint) {

        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        //Check the balance of msg.sender
        require(balance[msg.sender] >=amount, "Balance is not sufficient!");
        require(msg.sender != recipient, "Dont traansfer fund to yourself!");
        
        //identifying the balance before transfer in order to assert the execution at the end of function
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        //assert that the amount has been transfered from msg.sender to recipient
        assert(balance[msg.sender] == previousSenderBalance - amount); 

    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;     
    }
}
