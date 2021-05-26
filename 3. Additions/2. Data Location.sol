/****DataLocation****/

/* There are 3 different Locations where the data stored in Solidity:
    1. storage: permanent storage of Data - i.e. Data are persistent over time and over function execution.
                e.g. State Variables (uint data = 100) we dont need to declare it like (uint storage data = 100)
                
    2. memory: temporary data storage - within the function and will be erased after the execution is over.
                e.g. (string memory text) - 
                
                *For (simple) value data type: i.e. int, uint, bool, bytes, address, fixed size array .etc 
                we dont need to declare memory as location of these value variables because either way will be stored in memory
                no other choise.
                
    3. calldata: similar to memory but read only - not stored in memory - cost a lot less gas, less than memory */


pragma solidity 0.7.5;

contract DataLocation {
    
    uint data = 100; 
    
    function getString (string memory text, uint number) public pure returns (string memory) {
        return text;
    
    }
}
