pragma solidity ^0.5.0;

import './RWD.sol';
import './Tether.sol';

//Depositing, Rewarding, Staking our RWD and Tether Tokens
contract DecentralBank {
    address public owner;
    string public name = 'DecentralBank';
    Tether public tether;
    RWD public rwd;

    constructor(RWD _rwd, Tether _tether) public {
        rwd = _rwd;
        tether = _tether;
    }

}
