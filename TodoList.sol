// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract TodoList {
    struct Task {
        string name;
        bool completed;
    }

    mapping(address => Task[]) private tasks;

    function create(string memory _name) public {
        require(bytes(_name).length > 0, "Task name cannot be empty.");
        tasks[msg.sender].push(Task(_name, false));
    }

    function update(uint _index, bool _completed) public {
        require(_index < tasks[msg.sender].length, "Invalid task index.");
        tasks[msg.sender][_index].completed = _completed;
    }

    function get(uint _index) public view returns (string memory, bool) {
        require(_index < tasks[msg.sender].length, "Invalid task index.");
        Task memory task = tasks[msg.sender][_index];
         return (
            task.name,
            task.completed
        );
    }

    function kill() public {
        selfdestruct(payable(msg.sender));
    }
}