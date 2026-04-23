import 'package:flutter/rendering.dart';

class Cliente {
  final String nombre;
  final String apellidos;
  final String telefono;
  final String direccion;
  final String correo;
  final String code_user;

  Cliente ({required this.nombre, 
  required this.apellidos, 
  required this.telefono,
  required this.direccion,
  required this.correo,
  required this.code_user,
  });

  factory Cliente.fromJson(Map<String, dynamic>json){
    return Cliente(
      nombre:json["nombre"],
      apellidos:json["apellidos"],
      telefono:json["telefono"],
      direccion:json["direccion"],
      correo:json["correo"],
      code_user:json["code_user"],
    );
      
    
  }


  
}