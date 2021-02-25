// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/**
 * @title NiceGuy
 * @dev Implements `freeTx` modifier to add a full transaction cost rebate to any function
 */
contract NiceGuy {

    /**
     * @dev Transfer all ether use in the contract function back to the sender
     */
    modifier freeTx() {
        uint256 startGas = gasleft();
        _;
        uint256 spentGas = startGas - gasleft() + 21000 + 16 * msg.data.length;
        payable(msg.sender).transfer(spentGas * tx.gasprice);
    }

}