### Differences between require and assert   

https://codeforgeek.com/assert-vs-require-in-solidity/  

1. Behavior of assert and require functions
    The assert() and require() functions are a part of the error handling aspect in Solidity. Solidity makes use of state-reverting error handling exceptions. This means all changes made to the contract on that call or any sub-calls are undone if an error is thrown. It also flags an error.They are quite similar as both check for conditions and if they are not met, would throw an error.  
2. Gas Utility  
    The big difference between the two is that the assert() function when false, uses up all the remaining gas and reverts all the changes made.

    Meanwhile, a require() function when false, also reverts back all the changes made to the contract but does refund all the remaining gas fees we offered to pay. This is the most common Solidity function used by developers for debugging and error handling.

When to use require() and assert()?  

+ The assert function should only be used to examine invariants and test for internal problems.
+ The require function should be used to check return values from calls to external contracts or to guarantee that valid conditions, such as inputs or contract state variables, are satisfied.  


Analysis tools, when used correctly, can assess your contract and discover the conditions and function calls that will result in a failed assert. A properly running program should never reach a failing assert statement; if this occurs, there is a flaw in your contract that has to be addressed.




