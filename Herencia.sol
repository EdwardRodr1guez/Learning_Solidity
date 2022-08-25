// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./Interface.sol";
import "./Estructura.sol";

contract Herencia is Suma, Modificadores  {

        //Hacer el override
        function sumar(uint numero1,uint numero2) public override EsOwner_v2() returns(uint){
           return numero1+numero2;  
        }
 
}