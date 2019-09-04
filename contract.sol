pragma solidity ^0.5.8;

contract SimpleToken {
    address payable owner;
    
    string symbol ="STK";
    
    mapping(address => uint) public balanceOf;
    
    constructor() public {
        balanceOf[msg.sender] = 1000000000000;
        owner = msg.sender;
    }
    function transfer(address _to, uint _value) public {
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value>= balanceOf[_to]);
        address _from = msg.sender;
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
    }
    
    function buy() public payable{
        uint stk = msg.value*10;
        balanceOf[owner] -= stk;
        balanceOf[msg.sender] += stk;
    }
    function sell(uint _amount)  public payable {
        uint weiamount = _amount/10;
        balanceOf[owner] += _amount;
        balanceOf[msg.sender] -= _amount;
        msg.sender.transfer(weiamount);
    }
}
