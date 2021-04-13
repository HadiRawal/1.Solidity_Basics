pragma solidity 0.7.5;

contract HelloWorld {
    
    int number;
    
    function getNumber() public view returns(int) {
        return number;
    }
    //View Function: because we dont need to change the state variable just we need to print it out
    
    function setNumber(int _number) public {
        number = _number;
    }
    //Undefined Function: because we need to change the state variable but we cant print it out i.e. no returns
    
}