pragma solidity ^0.8.10;

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

// Parent contracts can be called directly, or by using the keyword super.

// By using the keyword super, all of the immediate parent contracts will be called.


contract A {
    // This is called an event. You can emit events from your function
    // and they are logged into the transaction log.
    // In our case, this will be useful for tracing function calls.


    event Log(string message);
    
    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }

}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }

}


contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}




