pragma solidity ^0.7.4;

contract mappingsStruct {
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getBalance() public view returns(uint) {
    return address(this).balance;    
    }
    
    function sendMoney() public payable {
        
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner,"You are not the owner");
        _to.transfer(this.getBalance());
         
    }
}