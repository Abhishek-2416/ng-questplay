// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SafeMath {
    /// @notice Returns lhs + rhs.
    /// @dev Reverts on overflow / underflow.
    function add(int256 lhs, int256 rhs) public pure returns (int256 result) {
        assembly {
            // Perform the addition
            result := add(lhs, rhs)

            // Check for overflow
            // If lhs and rhs are both positive and the result is negative, overflow occurred
            // If lhs and rhs are both negative and the result is positive, underflow occurred
            let overflow :=
                or(
                    and(gt(lhs, 0), gt(rhs, 0)), // Both are positive
                    and(lt(lhs, 0), lt(rhs, 0)) // Both are negative
                )
            overflow :=
                and(
                    overflow,
                    or(
                        gt(result, lhs), // Overflow check
                        lt(result, lhs) // Underflow check
                    )
                )

            // Revert if overflow occurred
            if overflow { revert(0, 0) }
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
