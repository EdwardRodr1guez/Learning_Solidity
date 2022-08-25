// SPDX-License-Identifier: GPL-3

pragma solidity  >=0.7.0 <0.9.0;  //versiones del compilador

contract Estructura {             //Creación de un contrato
         
         int     cantidad;        //variable entero
         uint    uCantidad;       //variable entero sin signo
         address direccion;       //variable de tipo address
         bool    firmado;         //variable booleana 

         struct  Alumno {         //variable de tipo estructura
                 string nombre;
                 uint   edad;         
         }

         Alumno[] public alumno1; //Lista (estática) con los campos definidos por la estructura (si se selecciona como pública se podrá luego consultar información de esta variable) 
         Alumno   public alumno2; //Estructura

         constructor(){
                 alumno1.push(Alumno({nombre: "Petro", edad: 18}));  //Forma #1
                 alumno2 =Alumno("Gustavito",20);                    //Forma #2
         }
}



contract learn_mappings {
         mapping(address => uint ) public balance; //variable mapping (diccionario)
         enum Estado {iniciado,finalizado}  //enum o tipo de dato personalizado
    
         Estado public estadoContrato;             //variable de tipo Estado (enum)

         constructor(){
            estadoContrato=Estado.iniciado;

            balance[msg.sender]=1000;

            estadoContrato=Estado.finalizado;
         }
}


contract condicionales {

        uint[] public numeros;
        string public resultado;

        constructor(bool condicion){
                if (condicion){
                resultado = "Condicion True";
                }
                else{
                resultado = "Condicion False";
                }

                for (uint iterador =0; iterador <10; iterador++){
                numeros.push(iterador);
                }
        }

}


contract Eventos {
    
    uint[] public numeros;
    string public resultado;
    
    event NotificacionDeCondicion(bool condicion);
    
    constructor(bool condicion) {
        if (condicion) {
            resultado = "Condicion True";
        }
        else {
            resultado = "Condicion False";
        }
        
        emit NotificacionDeCondicion(condicion);
        
        for (uint iterador = 0; iterador < 10; iterador++) {
            numeros.push(iterador);
        }
    }
}


contract Funciones{
        //Función pública
        function Suma (int a, int b)  public pure returns (int){ 
                return a+b;
        }

        //Función privada
        function SumaInterna (int a, int b) private pure returns (int){
                return a+b;
        }

        uint private resultado;
        function Obtener() public view returns (uint){
                 return resultado;  
        } 


}


contract Modificadores{

        address private owner;
        constructor(){
                owner =msg.sender;
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


contract Transferencia {

   constructor() payable {

   }


   function tx_by_send (address destino, uint cantidad) public returns (bool){
           bool   salida = payable(destino).send(cantidad); 
           return salida;
   }  


   function tx_by_transfer(address destino, uint cantidad) public {
           payable(destino).transfer(cantidad);
   }


    function tx_by_call (address destino, uint cantidad) public returns (bool){
           (bool salida, bytes memory respuesta) = destino.call{value:cantidad}(""); 
           return salida;
   }  


}



contract Recepcion {

   mapping(address => uint) balances;

   receive() external payable{
           balances[msg.sender] += msg.value;
   }

   fallback() external payable {

   }

   function recibirsaldo(uint numero) public payable {
           uint monto =msg.value;
   }
}