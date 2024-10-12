// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Comparisons {
    /// @notice Returns value == 0.
    function isZero(int256 value) public pure returns (bool isZero_) {
        assembly {
            isZero_ := eq(value, 0)
        }
    }

    /// @notice Returns lhs > rhs.
    function greaterThan(uint256 lhs, uint256 rhs) public pure returns (bool greater) {
        assembly {
            greater := gt(lhs, rhs)
        }
    }

    /// @notice Returns lhs < rhs.
    function signedLowerThan(int256 lhs, int256 rhs) public pure returns (bool lower) {
        assembly {
            lower := slt(lhs, rhs)
        }
    }

    /// @notice Returns true if value < 0 or value == 10, false otherwise.
    function isNegativeOrEqualTen(int256 value) public pure returns (bool negativeOrEqualTen) {
        assembly {
            let isNegative := slt(value, 0)

            let isEqualToTen := eq(value, 10)

            negativeOrEqualTen := or(isNegative, isEqualToTen)
        }
    }

    /// @return inRange true if lower <= value <= upper, false otherwise
    function isInRange(int256 value, int256 lower, int256 upper) public pure returns (bool inRange) {
        assembly {
            let isGreaterOrEqual := gt(value, sub(lower, 1))
            let isLesserOrEqual := lt(value, add(upper, 1))

            inRange := and(isLesserOrEqual, isGreaterOrEqual)
        }
    }
}

/* 
Here is a summary of the relevant opcodes (all found in the EVM dialect table):

Comparison

Dialect Instruction

==	eq(x, y)
>	gt(x, y)
> (signed)	sgt(x, y)
<	lt(x, y)
< (signed)	slt(x, y)
&&	and(x, y)
||	or(x, y)
There is no opcode for <= and >=. However, these can be emulated with two comparison checks.

The number of opcodes might seem overwhelming, but there is no need to memorize all the codes. Simply know that they are available and can be referred to in Solidity's documentation.

Also, recall that all variables in assembly are 256 bit values, even booleans. All of the instructions shown in the table above return a 256 bit value (either 0 or 1).

*/
