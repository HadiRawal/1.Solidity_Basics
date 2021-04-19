//***Layout of a Solidity Source File***//

/* In Solidity the Source file can contain number of 
  1. Pragma directives
  2. Import directives
  3. Constant variable definitions
  4. Structs definitions
  5. Events definitions
  7. Enum definitions
  3. Contract definitions
  9. Functions */

pragma solidity 0.7.2; /* The pragma keyword is used to enable certain compiler features or checks
                          There are many types of paragma:
                          1. Version Pragma:
                             "pragma solidity 0.x.x" is used to call solidity version
                          2. ABI Coder Pragma: (Application Binary Interface) 
                             by using "pragma abicoder v1" or "pragma abicoder v2"
                          3. Experimental Pragma: It can be used to enable features of the compiler or language
                             that are not yet enabled by default ()


                          */

contract HelloWorld {   /* Contracts in Solidity are similar to classes in object-oriented languages. 
                           Each contract can contain declarations of:
                           1. State Variables, 
                           2. Functions, 
                           3. Function Modifiers, 
                           4. Events, 
                           5. Struct Types  
                           7. Require & Assert ;and
                           6. Enum Types. */
    
    string public Greeting = "Hello World";
                        /* State Variables:are variables whose values are permanently stored 
                           in contract storage. There are four types of visibility for state variables.
                           We call them visibility specifiers 1.external, 2.public, 3.internal 4.private*/
                           

    function Hello() public view returns(string memory) {
         return Greeting; 
                         /* Functions are the executable units of code. Functions are usually defined 
                            inside a contract,but they can also be defined outside of contracts.
                            *Function Visibility:
                            There are four types of visibility for functions and state variables.
                            We call them visibility specifiers 1.external, 2.public, 3.internal 4.private
                            *Getter Function (View): 
                             that does not take any arguments and returns variable, 
                            *Pure Function: 
                             declared as pure in which case they promise not to read from or modify the state.
                            **/

    }
}