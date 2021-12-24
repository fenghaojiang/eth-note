pragma solidity >=0.7.0 <0.9.0;


contract Ballot {
    struct Voter {
        uint weight;
        bool voted;
        address delegate; // person delegated to
        uint vote;// index of the voted proposal
    }

    struct Proposal {
        // If you can limit the length to a certain number of bytes, 
        // always use one of bytes1 to bytes32 because they are much cheaper
        bytes32 name;
        uint voteCount; // number of accumulated votes
    }

    address public chairperson;

    mapping(address => Voter) public voters;

    Proposal[] public proposals;
}