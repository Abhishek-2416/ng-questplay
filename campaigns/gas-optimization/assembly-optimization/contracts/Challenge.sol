// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

abstract contract Challenge {
    /**
     * @notice Returns a copy of the given array in a gas-efficient way.
     * @dev This contract will be called internally.
     * @param array The array to copy.
     * @return copy The copied array.
     */
    function copyArray(
        bytes memory array
    ) internal pure returns (bytes memory copy) {
        assembly {
            // Create a new memory array with the same length as the original
            let length := mload(array) // Load the length of the original array
            copy := mload(0x40) // Get the free memory pointer
            mstore(copy, length) // Store the length of the copied array
            mstore(0x40, add(copy, add(0x20, length))) // Update the free memory pointer

            // Copy the data from the original array to the new array
            let dataOffset := add(array, 0x20) // Offset to the start of the data in the original array
            let copyOffset := add(copy, 0x20) // Offset to the start of the data in the copied array

            // Use a loop to copy each byte
            for {
                let i := 0
            } lt(i, length) {
                i := add(i, 0x20)
            } {
                mstore(add(copyOffset, i), mload(add(dataOffset, i)))
            }
        }
    }
}
