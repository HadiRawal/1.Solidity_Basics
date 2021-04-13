//TYPES OF Variables:
// SOLIDITY is typed Lanaguage = we need to inform the type of variable we use unlike JavaScript.
int a = 1; // =>0 = signed integer
uint aa = 2; // it can be negative = unsigned integer
string = b "hello"; // = string
bool c = false; // = boolean (true or false)
address d = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // =Ethereum Address, it is specific for SOLIDITY for transactions 

a = "Hello"  // will not work, because we didn't assign the variable type

pragma solidity 0.7.5; 

 contract HelloWorld { 
     
//State Variable:     
 string message; // State variables = preserve the state of the entire contract 
 
//Constructor : 
 constructor (string memory _message) {
      message = _message; 
    }
    // constructor runs only ones, when the contract is deployed, this keeps the contract more dynamic
    // constructor is used in order to initialize the contract with intial values by the contract creator 
    

//TYPES OF Functions :
    function hello(string memory newMessage) public {
        /*int number: Local variable = we can set variable here within the function, then it is local one, 
        readable only within this function.*/ 
        message = newMessage;
    }
    // (undefined) (function) : it can change the State variables but it cant print the message i.e. no returns
    
    
    function hello1() public view returns(string memory) {
       return message;vf
    }
    // view (function) : it can read state variables but can't change them. onlz viewing (reading)
    
    
    function hello2() public pure returns(string memory) {
       return "HelloWorld from Pure Function";
    }
    /* pure (function) : this function is not interacting with anything out of this function. 
                         also it cant read the state variables. */
  
//Special Variables: 
               //these variables are defined automatically in Solidity.
    msg.sender //this is the Ethereum address of sender of the transaction who called this contract.
               // msg.sender ==0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 
    msg.value  // this will contain the value of the transaction (ether) 
  
}