// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Interaction {
    //mapping key value paar
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;  //uint(ID)를 키로 해서 Person을 저장

    uint256 openingTime = 1743539166; // unix epoch time : https://www.epochconverter.com/

    modifier onlyWhileOpen() { //only open in certain time
        require(block.timestamp >= openingTime); 
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(
        string memory _firstName,
        string memory _lastName) 
        public 
        onlyWhileOpen 
        {
        incrementCount(); 
        people[peopleCount] = Person(peopleCount, _firstName, _lastName); 
    }

    function incrementCount() internal {
        peopleCount += 1;
    }

}

