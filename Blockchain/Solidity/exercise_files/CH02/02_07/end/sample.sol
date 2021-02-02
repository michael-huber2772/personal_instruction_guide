// import solidity
pragma solidity ^0.4.0;

contract Simple {
    // Arithmetic operators + - * / % **
    uint a = 2;
    utin b = 3;
    
    uint c = a ** b;
    
    // logical operators
    // !  && || == !=
    bool hasMoney = !false;
    
    // Bitwise operators
    // & | ^ ~ >> <<
    // below says the variable = 0x02 or 0x01
    bytes1 contractValue = 0x02 | 0x01;
    
}