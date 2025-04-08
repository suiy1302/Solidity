// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract MyContract {

    string value; // value entire contract know about, store in blockchain will be stored
    string public constant val = "Value"; // constant vaule 
    bool public myBool = true; 
    int public myInt = 1; //integer can be signed
    uint public myUint = 1; // integer can be unsigned 
    uint8 public myUnit8 = 8;
    uint256 public myUnit256 = 999999;

    
    // constructor()  { //only one constructor in one project 
    //      value = "myValue";
    // }
    // function get() public view returns(string memory) {
    //     return value;
    // }
    // function set(string memory _value) public {
    //     value = _value; //first value is from initial, second is local 
    // }

    enum State {Waiting, Ready, Active}
    State public state;
    constructor() {
        state = State.Waiting;

    }
    function activate() public {
        state = State.Active;
    }
    function isActive() public view returns(bool) {
        return state == State.Active;
    }
}