pragma solidity ^0.8.10;


contract Gas {
    uint public i = 0;


    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    function forever() public {
        while(true) {
            i += 1;
        }
    }
}