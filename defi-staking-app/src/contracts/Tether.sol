pragma solidity ^0.5.0;

//Send & Recieve Tether

contract Tether {
    string public name = 'Tether';
    string public symbol = 'USDT';
    uint256 public totalSupply = 1000000000000000000000000; //1 millions tokens
    uint8 public decimals = 18;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value,
    );

    event Approval()
        address indexed _owner,
        address indexed _spender,
        uint _value,

    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;


    constructor() {
        //Total supply within the tether
        balanceOf[msg.sender] = totalSupply;  
    }

    //Transfering from main contract to someone's wallet
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function  approve(_address spender, uint256 _value) public returns (bool sucess) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    //Allows for third parties to run transactions with approval
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_to] += _value;
        balanceOf[_from] -= _value;
        allowance[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;

    }
}


