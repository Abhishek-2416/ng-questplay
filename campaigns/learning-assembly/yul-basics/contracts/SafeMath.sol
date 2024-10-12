// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SafeMath {
    /// @notice Returns lhs + rhs.
    /// @dev Reverts on overflow / underflow.
    function add(int256 lhs, int256 rhs) public pure returns (int256 result) {
        // Convert this to assembly
        // result = lhs + rhs;

        assembly {
            result := add(lhs, rhs)
        }
    }

    /// @notice Returns lhs - rhs.
    /// @dev Reverts on overflow / underflow.
    function sub(int256 lhs, int256 rhs) public pure returns (int256 result) {
        // Convert this to assembly
        result = lhs - rhs;

        assembly {
            result := sub(lhs, rhs)
        }
    }

    /// @notice Returns lhs * rhs.
    /// @dev Reverts on overflow / underflow.
    function mul(int256 lhs, int256 rhs) public pure returns (int256 result) {
        // Convert this to assembly
        result = lhs * rhs;

        assembly {
            result := mul(lhs, rhs)
        }
    }

    /// @notice Returns lhs / rhs.
    /// @dev Reverts on overflow / underflow.
    function div(int256 lhs, int256 rhs) public pure returns (int256 result) {
        // Convert this to assembly
        result = lhs / rhs;

        assembly {
            result := sdiv(lhs, rhs)
        }
    }
}
