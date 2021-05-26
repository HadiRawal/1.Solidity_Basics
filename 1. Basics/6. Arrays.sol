pragma solidity 0.7.5; 

contract HelloWorld {
    
    int[] numbers; 
    // identifying unlimited array contains int elements, its name (numbers)
    
    function addNumber (int _number) public {
        numbers.push(_number);
    //.push only used with unlimited array
    }
    
    function getNumber (uint _index) public view returns(int){
        return numbers[_index];
    }
    // _index should be defined as unit only because it cant be negative.
    
    function getNumbers () public view returns(int [] memory){
        return numbers;
    // return the entire Array 
    }
}