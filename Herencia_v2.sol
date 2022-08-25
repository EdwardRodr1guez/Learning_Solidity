// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./Interface.sol";
import "./Modificadores_v2.sol";

contract Herencia_v2 is Suma, Modificadores_v2  {

        constructor(string memory nombreNuevo) Modificadores_v2(nombreNuevo) { //esto pasa debido a que faltan parámetros para el constructor dentro del archivo modificadores_v2

        } 
        //Hacer el override
        function sumar(uint numero1,uint numero2) public override EsOwner_v2() returns(uint){
           return numero1+numero2;  
        }
 
}