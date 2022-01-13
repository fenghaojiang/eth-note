### Storage vs Memory in Solidity   



Difficulty Level : Basic
Last Updated : 16 Jun, 2021
Storage and Memory keywords in Solidity are analogous to Computer’s hard drive and Computer’s RAM. Much like RAM, Memory in Solidity is a temporary place to store data whereas Storage holds data between function calls. The Solidity Smart Contract can use any amount of memory during the execution but once the execution stops, the Memory is completely wiped off for the next execution. Whereas Storage on the other hand is persistent, each execution of the Smart contract has access to the data previously stored on the storage area.

Every transaction on Ethereum Virtual Machine costs us some amount of Gas. The lower the Gas consumption the better is your Solidity code. The Gas consumption of Memory is not very significant as compared to the gas consumption of Storage. Therefore, it is always better to use Memory for intermediate calculations and store the final result in Storage.

State variables and Local Variables of structs, array are always stored in storage by default.
Function arguments are in memory.
Whenever a new instance of an array is created using the keyword ‘memory’, a new copy of that variable is created. Changing the array value of the new instance does not affect the original array.
Example#1: In the below example, a contract is created to demonstrate the ‘storage’ keyword.

```solidity
pragma solidity ^0.4.17;
 
// Creating a contract
contract helloGeeks
{
  // Initialising array numbers
  int[] public numbers;
 
  // Function to insert values
  // in the array numbers
  function Numbers() public
  {
    numbers.push(1);
    numbers.push(2);
 
    //Creating a new instance
    int[] storage myArray = numbers;
     
    // Adding value to the
    // first index of the new Instance
    myArray[0] = 0;
  } 
}
```