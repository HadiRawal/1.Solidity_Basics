pragma solidity 0.7.5;

contract HelloWorld {
    
    string message; // we can set the intial value here but it will be more static e.g. string message = "Hello World"
    
    constructor (string memory _message) { 
      message = _message;  // this will set _message to the variable message
      
       /* (string memory _message) = also within the constructor we need to identify 
       the type of initial value (message) that we wanna set it to the variable (message)*/

    }
    
    function hello() public returns(string memory) {
     return message;
     
    }
}