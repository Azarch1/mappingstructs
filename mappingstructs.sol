pragma solidity ^0.7.4;

contract mappingsStruct {
    
    address owner;
    
    mapping(address => uint) public balanceReceived;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getBalance() public view returns(uint) {
    return address(this).balance;    
    }
    
    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner,"You are not the owner");
        _to.transfer(address(this).balance);
         
    }
    
    function withdrawBalance(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "You don't have enough funds");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}