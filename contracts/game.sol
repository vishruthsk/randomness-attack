//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract game{
    constructor() payable{}

    function pickcard() private view returns(uint){
        uint Pickcard= uint(keccak256(abi.encodePacked(blockhash(block.number),block.timestamp)));
        return Pickcard;
    }

    function guess(uint256 _guess) public {
        uint _pickcard = pickcard();
        if(_guess == _pickcard){
            (bool sent,)= msg.sender.call{value: 0.1 ether}("");
            require(sent," failed to send");
        }
    }

    function balance() public returns(uint256){
        return address(this).balance;
    }
}