pragma solidity ^0.5.8;

contract Bank{
    uint public totalDeposit;
    address dev1;
    address dev2;
    mapping(address => uint) balanceOf;
    
    constructor(address _dev1, address _dev2) public{
        dev1 = _dev1;
        dev2 = _dev2;
    }
    
    function deposit() public payable{
        balanceOf[msg.sender] += msg.value;
        totalDeposit += msg.value;
    }
    
    function withdraw(uint _amount) public payable {
        require(balanceOf[msg.sender] >= _amount);
        balanceOf[msg.sender] -= _amount;
        totalDeposit -= _amount;
        msg.sender.transfer(_amount);
    }
    
    function getBalanceOf(address _account) public view returns(uint){
        return balanceOf[_account];
    }
}
