pragma solidity ^0.5.8;
contract CrowdFunding {
    struct Investor{
        address payable addr;
        uint amount;
        
    }
    mapping(uint => Investor) public investors;
    uint numOfInvestors;
    
    uint goalAmount;
    uint totalAmount;
    address payable owner;
    
    modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
    constructor(uint _goalAmount) public{
        owner = msg.sender;
        goalAmount = _goalAmount;
    }
    function fund() public payable {
       investors[numOfInvestors] = Investor(msg.sender, msg.value);
       numOfInvestors ++;
       totalAmount += msg.value;
    }
    
    function checkGoalFunding() public payable onlyOwner{
            if(totalAmount >= goalAmount) {
                owner.transfer(address(this).balance);
            }else{
                for(uint i= 0; i <numOfInvestors; i++) {
                 investors[i].addr.transfer(investors[i].amount); 
            }
        }
        
    }
    
    function killContract() public onlyOwner {
        selfdestruct(owner);
    }
       
}
