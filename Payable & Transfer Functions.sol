//***Payable & Transfer Functions***//

pragma solidity 0.7.5;

//This is an Ether Bank contract where we can store and withdraw ether in some addresses.

contract Bank {
    mapping(address => uint) balance;
    address owner;
    
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
    
    
    event depositDone (uint amount, address indexed depositedTo);

    constructor() {
        owner = msg.sender;
    } 
    
    function deposit() public payable returns (uint) {
    //We dont need for parameters because the input is the native token of the network.
    //this function will not be only for owner, but for anyone to deposit in his own address.
    //"payable" is the magic word to make this function as depositable
        balance[msg.sender] += msg.value;
        emit depositDone (msg.value, msg.sender);
        return balance[msg.sender];
    }
    
   function withdraw(uint amount) public returns (uint){
       
    /*in order to avoid withdrawing more than you own of ether from the bank,
    we need to apply condition i.e. the withdrawal amount is not more than what you have in the bank*/
    /* if transfer for any reason fail, the transfer function will revert the transaction. */
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


