// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract BCBC {
    address public mintor;
    mapping (address => uint) public balancies;

event sent(address from, address to, uint amount);
    constructor() payable  
    {
        mintor =msg.sender;
    } 

    function mint(address reciever, uint amount)  public {
        require(msg.sender== mintor);
        balancies[reciever] +=amount;

    }

   error insufficientBalance(uint requested, uint available);
function send (address reciever, uint amount)  public {

    if(balancies[msg.sender] < amount)
    revert insufficientBalance({
        requested:amount,
        available:balancies[msg.sender]

    });
    balancies[msg.sender]-=amount;
    balancies[reciever]+=amount;
    emit sent (msg.sender, reciever, amount);

}



}