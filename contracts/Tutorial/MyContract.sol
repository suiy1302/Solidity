// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyContract {
    // enum State {Waiting, Ready, Active} // 자동으로 integer값 저장 Waiting=0, Ready = 1, Active = 2
    // State public state;

    // constructor() {
    //     state = State.Waiting;
    // }
    // function activate() public {
    //     state = State.Active;
    // }

    // function isActive() public view returns(bool){
    //     return state == State.Active;
    // }

    // Person[] public people; // Person is in array , do not return whole names, people -> 0 return first person added
    // uint256 public peopleCount;
    // struct Person {
    //     string _firstName;
    //     string _lastName;
    // }
    // function addPerson(string memory _firstName, string memory _lastName) public {
    //     people.push(Person(_firstName, _lastName));
    //     peopleCount += 1;
    // }

    //mapping key value paar
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;  //uint(ID)를 키로 해서 Person을 저장

    address owner; //이 컨트랙트를 배포한 사람의 지갑 주소 (관리자 역할)

    modifier onlyOwner() {
        require(msg.sender == owner); //호출자가 owner가 아니면 실행 중지 (에러 발생)
        _; //원래 함수의 본문이 여기에 들어온다 다음 함수 호출
    }

//     msg.sender	이 트랜잭션을 보낸 지갑 주소 (즉, 호출자)
//    msg.value	이 트랜잭션이 보낸 이더(wei) 수량
// msg.data	함수 호출 시 전달된 데이터 전체(raw bytes)
// msg.sig	함수의 첫 4바이트 서명(Signature Hash)
// 즉, msg는 "누가 호출했는가, 얼마를 보냈는가" 같은 컨텍스트를 담고 있는 객체야.
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor()  {
        owner = msg.sender; //// 배포한 사람의 주소 저장
    }


    function addPerson(
        string memory _firstName, //argument
        string memory _lastName) 
        public 
        onlyOwner //modifier
        {
        incrementCount(); // or without private function just peoplecount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName); // peoplecount = id
    }

    function incrementCount() internal {// function modifiyer, private fuction, cannot see on the Deployed Contracts
        peopleCount += 1;
    }

    //msg: 택배 상자
// msg.sender: 택배 보낸 사람
// msg.value: 택배 안에 들어있는 돈
// _: "여기서 본론 시작!"이라는 북마크

}
//항목	constructor	struct
// 정의	컨트랙트 배포 시 실행되는 함수	사용자 정의 데이터 구조
// 실행 시점	배포 시 자동 1회	필요할 때 생성
// 용도	초기값 설정, 상태 준비	복합 데이터 저장
// 키워드 사용법	constructor()	struct Name { ... }
// JavaScript 비교	constructor	object type 또는 class

//only owner can call the contracts, only owner can call addPerson

