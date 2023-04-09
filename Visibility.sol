// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// visibility of functions or state variables
// private - only inside contract
// internal - only inside contract and child contracts
// public - inside and outside contract
// external - only from outside contract

contract Visibility {
    uint private x = 1;
    uint internal y = 2;
    uint public z = 3;

   function privateFunc() private pure returns (uint) {
        return 0;
    }

    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    function publicFunc() public pure returns (uint) {
        return 200;
    }

    function externalFunc() external pure returns (uint) {
        return 300;
    }


    function example() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();
        this.externalFunc(); // don't have enougnt gas
    }
}

contract VisibilityChild is Visibility {
    function examples2() external view {
        y + z;
        internalFunc();
        publicFunc();

    }

    // inherit
    // function externalFunc() external pure returns (uint) {
    //     return 300;
    // }
}