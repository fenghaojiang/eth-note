pragma solidity ^0.8.10;

// Unlike functions, state variables cannot be overridden by re-declaring it in the child contract.

// Let's learn how to correctly override inherited state variables.


contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}


// Shadowing is disallowed in Solidity 0.6
// This will not compile
// contract B is A {
//     string public name = "Contract B";
// }



