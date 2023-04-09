// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract TodoList {
    struct Task {
        string name;
        bool completed;
    }

    Task[] public tasks;
    uint public taskCount;

    function create(string memory _name) public {
        require(bytes(_name).length > 0, "Task name cannot be empty.");
        tasks.push(Task(_name, false));
        taskCount++;
    }

    function update(uint _index, bool _completed) public {
        require(_index < taskCount || _index > taskCount, "Invalid task index.");
        tasks[_index].completed = _completed;
    }

    function get(uint _index) public view returns (string memory, bool) {
        require(_index < taskCount || _index > taskCount, "Invalid task index.");
        Task memory task = tasks[_index];
        return (task.name, task.completed);
    }

    function kill() public {
        selfdestruct(payable(msg.sender));
    }
}