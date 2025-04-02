// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
//import "./Math.sol";
// or 
//declare directly library in the code
// library Math{
//     function divide(uint256 a, uint256 b) internal pure returns (uint256) {
//         require(b > 0);
//         uint256 c = a / b;
//         return c;
//     }
// }
//or SafeMath
import "./SafeMath.sol";

contract MyContract {
    //DRY - "Don't repeat yourself"
    using SafeMath for uint256;
    uint256 public value;
    uint256 public value1;
    function calculate(uint _value1, uint _value2) public {
        //value = Math.divide(_value1, _value2); for using Math.sol 
        value = _value1.div(_value2);
        value1 = _value1.sub(_value2);
    }

}
