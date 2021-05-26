/* Self-destruct:
The only possibility that code is removed from the blockchain 
is when a contract at that address performs the selfdestruct operation. 
The remaining Ether stored at that address is sent to a designated target 
and then the storage and code is removed from the state. */



pragma solidity 0.7.5;

import "./Ownable.sol";

contract Destroyable is Ownable {

  function destroy() public onlyOwner {
    address payable receiver = msg.sender;
    selfdestruct(receiver);
  }
}