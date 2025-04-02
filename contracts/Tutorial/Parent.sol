// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
//override
contract ERC20Token {
    string public name;
    mapping(address => uint256) public balaences;

    function mint() public {
        balaences[tx.origin] ++;
    }
}

contract MyToken is ERC20Token {
    
    
}