// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.6;

contract ManejoDeTareas {

    uint idTarea;

    struct Tarea {
        uint id;
        string nombre;
        string descripcion;
    }

    Tarea[] tareas;

    function crearTarea ( string memory _nombre, string memory  _descripcion) public  {
            tareas.push(Tarea(idTarea,_nombre,_descripcion));
            idTarea++;

    
    }

    function encontrarTarea (uint _id) internal view returns (uint) {
      for(uint i=0; i < tareas.length; i++){
          if  ( tareas[i].id == _id)
          return i;
      }
      // revert de el proceso nos la da  solidity  es como un catch
      revert ("Task not found");
  }

    
    function leerTarea(uint _id) public view returns (uint, string memory , string memory){


           uint index = encontrarTarea (_id);
            return (tareas[index].id,tareas[index].nombre,tareas[index].descripcion);


    }

    function actualizarTarea(uint _id,string memory _nombre, string memory _descripcion) public {

        uint index = encontrarTarea(_id);
        tareas[index].nombre = _nombre;
        tareas[index].descripcion = _descripcion;
    }

    function borrarTarea(uint _id) public {

          uint index = encontrarTarea(_id);
         delete tareas[index];
    }

}