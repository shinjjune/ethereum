pragma solidity ^0.5.8;
// duplicate => bool (vote)
// add candidate => ownerOnly (addCandidate)

contract Vote {
    uint8 numOfCandidate = 0;
    mapping(address => bool) isVoted; 
    mapping(string => uint) score; // 각 후보자별 득표수
    mapping(uint8 => string) candidateList; // 후보자 리스트
    address payable owner;
    
    constructor () public {
        owner = msg.sender;
    }

    modifier ownerOnly () {
        require(msg.sender == owner);
        _;
    }
    
    modifier checkDuplicate() {
        require(!isVoted[msg.sender]);
        _;
    }

    function addCandidate (string memory candidate) public ownerOnly {
        bool found = false;
        for (uint8 i=0; i<numOfCandidate; i++){
            if(keccak256(bytes(candidateList[i])) == keccak256(bytes(candidate))) { // 문자가 비교가 안됨 keccak, sha3 등을 이용
                found = true;
                break;
            }
        }
        require(!found);
        candidateList[numOfCandidate] = candidate;
        numOfCandidate ++;
    }

    function vote (string memory candidate) public checkDuplicate {
        
        score[candidate] ++;
        isVoted[msg.sender] = true;
    }

    function getNumOfCandidate() public view returns (uint8) {
        return numOfCandidate;
    }

    function getCandidate(uint8 index) public view  returns (string memory) {
        return candidateList[index];
    }

    function getScore(string memory candidate) public view returns (uint) {
        return score[candidate];
    }
    
    //destroy contract
    function killContract() public ownerOnly {
        selfdestruct(owner);
    }
}
