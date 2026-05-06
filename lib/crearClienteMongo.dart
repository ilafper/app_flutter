import 'dart:ffi';

import 'package:app_flutter/home_mongo.dart';
import 'package:flutter/material.dart';
import 'apiService/api.dart';
import '../components/header.dart';

class CrearClienteMongo extends StatefulWidget {
  const CrearClienteMongo({super.key});

  @override
  State<CrearClienteMongo> createState() => _CrearClienteMongoState();
}

class _CrearClienteMongoState extends State<CrearClienteMongo> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellidos = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController correo = TextEditingController();

  @override
  void dispose() {
    nombre.dispose();
    apellidos.dispose();
    telefono.dispose();
    direccion.dispose();
    correo.dispose();
    super.dispose();
  }

  void enviarDatos() {
    print("asdasd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //const Color.fromARGB(255, 20, 20, 20),
      resizeToAvoidBottomInset: true,
      // usar el componente header
      appBar: const HeaderCustom(
        //nombre
        titulo: "Crear Usuario",
        // estilo texto
        tituloStyle: TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),

        backgroundColor: Color.fromARGB(255, 24, 23, 23),
        iconColor: Color.fromARGB(255, 248, 214, 23),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 24, 23, 23),

        // usar safe area para evitar que se corte el contenido ya que no puedo hacer heigth infinity para que ocupe todo , y si quito el single scroll en formulario cuando aparece el teclado para escribir aparece como un rectangulo de aviso que pone button ns que y molesta aunque no tenga un button como tal.
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                children: [
                  TextField(
                    controller: nombre,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),

                      floatingLabelStyle: TextStyle(
                        color: Color.fromARGB(
                          255,
                          248,
                          214,
                          23,
                        ), // color cuando tiene focus
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: apellidos,
                    decoration: InputDecoration(
                      labelText: "Apellidos",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),

                      floatingLabelStyle: TextStyle(
                        color: Color.fromARGB(
                          255,
                          248,
                          214,
                          23,
                        ), // color cuando tiene focus
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: telefono,
                    decoration: InputDecoration(
                      labelText: "telefono",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),

                      floatingLabelStyle: TextStyle(
                        color: Color.fromARGB(
                          255,
                          248,
                          214,
                          23,
                        ), // color cuando tiene focus
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: direccion,
                    decoration: InputDecoration(
                      labelText: "Direccion",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),

                      floatingLabelStyle: TextStyle(
                        color: Color.fromARGB(
                          255,
                          248,
                          214,
                          23,
                        ), // color cuando tiene focus
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: correo,
                    decoration: InputDecoration(
                      labelText: "Correo",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),

                      floatingLabelStyle: TextStyle(
                        color: Color.fromARGB(
                          255,
                          248,
                          214,
                          23,
                        ), // color cuando tiene focus
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 248, 214, 23),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  //boton
                  ElevatedButton(
                    onPressed: () async {
                      final res = ApiClientes.enviarDatos(
                        nombre: nombre.text,
                        apellidos: apellidos.text,
                        telefono: telefono.text,
                        direccion: direccion.text,
                        correo: correo.text,
                      );

                      if (res != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Mongo_Home()),
                        );
                        
                      }
                    },
                    child: Text("Crear Cliente"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // contenedor del
    );
  }
}
