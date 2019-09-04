pragma solidity ^0.5.8;
contract Lottery {


// 응모자를 관리하는 매핑
	mapping (uint => address) public applicants;

	// 응모자 수
	uint public numofApplicants;

	// 당첨자 정보
	address public winnerAddress;
	
	// 소유자
	address public owner;

	// 타임스탬프
	uint public timestamp;

	// 소유자 여부를 확인하는 modifier
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	// 생성자
    constructor() public{
        numofApplicants = 0;
        owner = msg.sender;
    }
    
    
    function enter() public {
        for(uint i = 0; i <numofApplicants; i++) {
            require(applicants[i] != msg.sender);
        }
        applicants[numofApplicants++] = msg.sender;
    }
    function hold() public onlyOwner{
        require(numofApplicants > 3);
        timestamp = block.timestamp;
        
        uint winnerInd = timestamp % numofApplicants;
        winnerAddress =applicants[winnerInd];
    }
}

