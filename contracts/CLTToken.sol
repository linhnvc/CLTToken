// SPDX-License-Identifier: MIT
// CLT stands for Cong Linh Token
// Author linhnvc from CLT Smart Chain
pragma solidity >=0.4.22 <0.9.0;

contract CLTToken {

    // Name of CongLinh Token
    string public name = 'CLT Token';
    // Symbol of CongLinh Token
    string public symbol = 'CLT';
    string public standard = 'CLT Token v1.0';
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // Approve
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );


    mapping(address => uint256) public balanceOf;    
    mapping(address => mapping(address => uint256)) public allowance;
    // Allowance


    constructor(uint256 _initialSupply) public { 
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply; 

    }

    // Transfer 
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Exception
        require(balanceOf[msg.sender] >= _value);
        // Transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // Transfer Event
        emit Transfer(msg.sender, _to, _value);

        // Return Boolean
        return true;  
    }

    // Delegate Transfer
    // Aprove
    function approve(address _spender, uint256 _value) public returns (bool success) {

        // allowance
        allowance[msg.sender][_spender] = _value;

        // approve event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    // TransferFrom
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {

        // Require _from has tokens
        require(_value <= balanceOf[_from]);
        // Require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);

        

        // Change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;


        // Transfer event
        emit Transfer(_from, _to, _value);

        // return boolean
        return true;
    }


}



// 02:50:00
