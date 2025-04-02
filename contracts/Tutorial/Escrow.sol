// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "./SafeMath.sol";
//Escrow 가 지정된 사용자 (payee)에게 돈을 예치하고 나중에 그 돈을 해당 사용자에게 안전하게 출금할 수 있게 해주는 시스템 
contract Escrow {
    using SafeMath for uint256;
    
    address agent; 
    mapping(address => uint256) public deposits;

    //only Escrow agent is allowed to access the contracts
    modifier onlyAgent() {
        require(msg.sender == agent); //msg.sender 이계약을 배포한 지갑 주소 
        _;
    }

    constructor() {
        agent = msg.sender; //sender is deploy the smart contract 
        //they can deposit funds into the escrow's smart contract and make sure actually paid on right person 
    }
    //how to deposit funds
    function deposit(address payee) public onlyAgent payable{ //payable = .transfer, .send와 같은 이더 전송 함수 사용가능 
        uint256 amount = msg.value; // msg.value = sent ether, 사용자가 보낸 이더 
        deposits[payee] = deposits[payee].add(amount);
    }
    //withdraw Escrow가 예치된 이더를 출금 (payee)에게 전송 
    function withdraw(address payable payee) public onlyAgent{
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }
    
}
//payable, address, msg.sender에서 sender가 뭔지 