pragma solidity ^0.5.0;

contract Migrations {
    address public owner;
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;

    }

    modifier restricted() {
        if (msg.sender == owner) _; //Continue with the function
    }

    //Set completion of contract
    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    } 

    //Update contract
    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
    
}