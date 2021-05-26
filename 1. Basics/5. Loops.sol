pragma solidity 0.7.5;

contract HelloWorld {
    
    function CountWhile(int numberW) public pure returns(int){
        int i = 0;
        while( i < 10 ) {
            numberW++;
            i++; 
        }
        return numberW;
    }
    
    function CountFor(int numberF) public pure returns(int){
        for( int i=0 ; i<10 ; i++ ) {
            numberF++;
        }
        return numberF;
    }   
}