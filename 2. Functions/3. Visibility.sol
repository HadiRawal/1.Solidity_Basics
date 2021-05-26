//Types of Visibility: to restrict the access to functions and state variable

   //Public: everyone can access it and excute it 

   //Private: only from within the contract can excuted 

   //Internal: Private and contracts deriving from it (inherited contracts)

   //External: only able to be excuted by other contracts and services (like remix)

pragma solidity 0.7.5;

contract Bank {
    mapping(address => uint) balance;
    
    function addBalance(uint _toAdd) public returns (uint) {
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        _transfer(msg.sender, recipient, amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;     
    }
}
   