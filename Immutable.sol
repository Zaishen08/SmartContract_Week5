// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Immutable {
    // 42392 gas
    // address public owner = msg.sender;
    // 31575 gas
    // address public immutable owner = msg.sender;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    uint public x;
    function foo() external {
        require(msg.sender == owner);
        x += 1;
    }
}