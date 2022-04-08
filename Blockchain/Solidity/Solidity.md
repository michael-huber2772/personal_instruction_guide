# Solidity

## Ethereum
+ Programmable blockchain
+ Provides environment to build anything
+ Peer-to-peer network

### EVM
EVM is completely isolated and has no access to file systems or processes.
+ Each node in the chain runs EVM to maintain consensus.
+ Ethereum is best suited for applications that automate direct interactions
  between peers or coordinate group actions across a network.

## Summary
+ Etherum is the environment
+ EVM executes the transactions
+ Solidity is the language to program smart contracts

# Compiler
Solidity uses a compiler information can be found [here](https://solidity.readthedocs.io)
The simplest way to get started is to use Docker.

To just play around with some code and learn go to the following [link](https://remix.ethereum.org).
This is an online environment where you can execute code.

# Solidity Code

**Comments**
```solidity
// double slashes are comments

/*
Multi-line comment
*/
```

**File Extension**
`.sol`

**Function**
A function will always start with the word `function`. From the examples below
+ `calcs` is the name of the function
+ `uint` is the data type of `_a`
+ `_a` is the parameter
+ `private` functions are internal and can only be run inside of that contract
+ `public` functions are accessible from outside your contract
+ `returns` is where you set the return types. These are the outputs for the
  function
```solidity
contract Simple {
    function calcs(uint _a, uint _b) public pure 
    returns (uint o_sum, uint o_product){
        o_sum = _a + _b;
        o_product = _a * _b;
    }
}
```
**Modifier**
```solidity
contract Inheritance {
    address owner;
    bool deceased;
    uint money;
    
    constructor() public payable {
        owner = msg.sender;
        money = msg.value;
        deceased = false;
    }
    
    modifier oneOwner {
        require (msg.sender == owner);
        _;
    }
    
    address[] wallets;
    
    mapping (address => uint) inheritance;
}
```

**Variables You Can't Use**
+ `ether`
+ `sazbo`
+ `finney`
+ `wei`

**Time Units**
+ `seconds`
+ `minutes`
+ `hours`
+ `days`
+ `weeks`


## Data Types
+ `uint` - integer

```solidity
// Declaring a string
string name;

// Declaring a string and initializing it
string name = "michael";

// integers
uint storedata = 34;

//boolean
bool atrueorfalsevalue = false;

// address
address walletAddress = 0x72ba7979734b;

// arrays -- can be declared as any of the types
string[] names;

// bytes -- you can do byte1 to byte32
byte32 code;

// Struct to define (you can create and declare your own types)
struct User {
  string firstName;
  string lastName;
}

//enums
enum userType {buyer, seller}

// mappings (like dictinaries in some other languages)
mapping(address => uint) public balances;
```

## Style Guide
+ Four spaces
+ Spaces over indentations
+ Block of code: two blank lines after
+ No extra white spaces


## Example Code
```solidity
// import solidity
pragma solidity ^0.4.0;

// import
import "filename";
import * as symbolname from "filename";
import {symbol1 as alias, symbol2} from "filename"'

// your first contract
contract SimpleContract {
    // state(current status) variable
    uint storedData;
    
    // modifier is  conditional
    modifier onlyData(){
        require(
            storedData >= 0);
            _;
    }
    
    // function
    function set(uint x) public {
        storedData = x;
    }
    
    //event
    event Sent(address from, address to, uint storedData);
    
}
```
