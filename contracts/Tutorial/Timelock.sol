// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
//savings, cannot touch money until deadline 

contract Timelock {
    // who can withdraw? -> beneficiary
    // how much? 
    // when? -> releaseTime
    // unix epoch time : https://www.epochconverter.com/
    address payable public beneficiary; 
    uint256 releaseTime;

    constructor(
        address payable _beneficiary, 
        uint256 _releaseTime
        )
        payable  
        {
         require(_releaseTime > block.timestamp);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }
    function release() public {
        require(block.timestamp >= releaseTime);
        beneficiary.transfer(address(this).balance);
    }



}