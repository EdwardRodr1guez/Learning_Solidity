// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Modificadores_v2{

        address private owner;
        string  private ownername;

        constructor(string memory name){
                owner     =msg.sender;
                ownername =name;
        }

        function Suma(int a,int b) public EsOwner_v2() returns (int){
                return a+b;               
        }

        modifier EsOwner(){
                if(msg.sender != owner){
                        revert();
                }
                else{
                _;
                }
                
        }

        modifier EsOwner_v2(){
                require(msg.sender == owner,"El usuario no es el creador del contrato" ); //lo que queremos que si se cumpla
                _;
        }

}