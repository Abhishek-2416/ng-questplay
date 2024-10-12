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
            let length := mload(array)
            copy := mload(0x40)
            mstore(copy, length)
            mstore(0x40, add(copy, add(0x20, length)))

            let dataOffset := add(array, 0x20)
            let copyOffset := add(copy, 0x20)

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
