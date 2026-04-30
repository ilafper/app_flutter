import 'package:flutter/material.dart';

import '../components/header.dart';

class CrearClienteMongo extends StatelessWidget {
  const CrearClienteMongo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //const Color.fromARGB(255, 20, 20, 20),
      
      // usar el componente header 
      appBar: const HeaderCustom(
        
        //nombre

        titulo: "Crear Usuario" ,
        // estilo texto
        tituloStyle: TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),

        backgroundColor: Color.fromARGB(255, 24, 23, 23),
        iconColor:Color.fromARGB(255,248,214,23),
        ),

      // contenedor del 
      body: Container(
        color: Color.fromARGB(255, 24, 23, 23), 
        //pading al contenedor
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                
                child: const Column(
                  
                 children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromARGB(255, 255, 8, 8)),
    ),
                    ),
                    
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Apellidos",
                      border: OutlineInputBorder()
                    ),
                  ),
                 ],

                 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}