// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract If {
    /// @notice Converts minutes to hours.
    /// Reverts if _minutes is negative or not divisible by 60.
    /// @param _minutes the number of minutes to convert to hours.
    /// @return _hours the number of hours represented by _minutes.
    function minutesToHours(int256 _minutes) public pure returns (uint256 _hours) {
        assembly {
            let condition := or(slt(_minutes, 0), smod(_minutes, 60))

            if condition { revert(0, 0) }

            _hours := div(_minutes, 60)
        }
    }
}
