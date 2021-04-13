pragma solidity 0.7.2; // here we call the version of SOL that we will use in our code//

contract HelloWorld {
    
    function Hello() public pure returns(string memory) {
         return "Hello World"; 
    
    //Public = this function can be called from anywhere. 
    //Pure = to tell the compiler that this function will not interact with any other part of the smart contract.
    //returns = what type of variables this function will return. 
    }
}