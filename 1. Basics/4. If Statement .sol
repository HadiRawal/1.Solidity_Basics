pragma solidity 0.7.5;

contract HellowWorld {
    
    string message;
    
    constructor (string memory _message) {
    message = _message;
    }
    
    function hello (int number) public view returns (string memory){
    
       if (number == 10){ // "==" is an operator, we have also ">", "<", ">=", "<=", "!=" (not equal) etc.
       
           return message;
       }
       else{
           return "Wrong Number"; 
       }
       return message;
    }
}
