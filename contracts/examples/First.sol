// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Counter {
    uint256 public count;

    address public immutable myAddr; //불변변수 한번 deploy하면 바뀌지 않음
    uint256 public immutable myUint;

    constructor(uint256 _myUint) {
        myAddr = msg.sender;
        myUint = _myUint;
    }

    // Function to get the current count
    function get() public view returns (uint256) {
        return count;
    }

    // Function to increment count by 1
    function inc() public {
        count += 1;
    }

    // Function to decrement count by 1
    function dec() public {
        // This function will fail if count = 0
        count -= 1;
    }
}