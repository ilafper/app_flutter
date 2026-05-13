import 'dart:ffi';

import 'package:app_flutter/apiService/apisql.dart';
import 'package:app_flutter/sql.dart';
import 'package:flutter/material.dart';
import 'apiService/api.dart';
import '../components/header.dart';


// los mismo de mongo pero para sql

class CrearClienteSql extends StatefulWidget {
  
  const CrearClienteSql({super.key});

  @override
  State<CrearClienteSql> createState() => _CrearClienteSqlState();
}



class _CrearClienteSqlState extends State<CrearClienteSql> {
  

  final TextEditingController nombre = TextEditingController();
  
  final TextEditingController apellidos = TextEditingController();
  
  final TextEditingController telefono = TextEditingController();
  
  final TextEditingController direccion = TextEditingController();
  
  final TextEditingController correo = TextEditingController();


  // para eviatr multiples clicks 

  bool loading= false;

  //validar formulario
  final _formKey = GlobalKey<FormState>();
  

  // liberar memoria y destruir recursos cuando una pantalla/widget deja de existir.
  @override
  void dispose() {
    nombre.dispose();
    apellidos.dispose();
    telefono.dispose();
    direccion.dispose();
    correo.dispose();
    super.dispose();
  }

  void enviarDatoSQL() {
    print("asdasd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // usar el componente header
      appBar: const HeaderCustom(
        //nombre
        titulo: "Crear Usuario SQL",
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

              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nombre,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "el nombre es obligatorio";
                        }
                        return null;
                      },
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

                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: apellidos,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "los apellidos son obligatorio";
                        }
                        return null;
                      },
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
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: telefono,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "el telefono es obligatorio";
                        }
                        return null;
                      },
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
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: direccion,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "la direccion es obligatoria";
                        }
                        return null;
                      },
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
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: correo,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "el correo es obligatorio";
                        }
                        return null;
                      },
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
                      onPressed: loading ? null : () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading=true;
                          });

                          //llamar a la funcion para crear cliente 
                          final res = await Apisql.crearClienteSql(
                            nombre: nombre.text,
                            apellidos: apellidos.text,
                            telefono: telefono.text,
                            direccion: direccion.text,
                            correo: correo.text,
                          );

                          setState(() {
                            loading=false;
                          });

                          if (res != null) {
                            //print(res["message"]);

                            if (res["success"] == true) {
                              print(res["message"]);
                              Navigator.pop(context);
                            } else {
                              print(res["message"]);
                            }
                          }
                        }
                      },
                      
                      child: loading ? SizedBox(
                        height: 10,
                        width: 10,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      ): Text("Crear Cliente"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // contenedor del
    );
  }
}