import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apiService/api.dart';
import 'package:app_flutter/models/cliente.dart';
import 'crearClienteMongo.dart';
import '../components/header.dart';

class Mongo_Home extends StatefulWidget {
  const Mongo_Home({super.key});

  @override
  State<Mongo_Home> createState() => _Mongo_HomeState();
}

class _Mongo_HomeState extends State<Mongo_Home> {
  List<Cliente> clientes = [];
  String filtroBusqueda = "";
  bool cargando= true;
  String mensajeErrror = "";
  @override
  void initState() {
    super.initState();
    print("INITSTATE EJECUTADO");
    cargarClientes();
  }

  cargarClientes() async {
    clientes = await ApiClientes.getClientes();
    cargando= false;
    mensajeErrror="";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderCustom(
        //nombre
        titulo: "Gestión de usuarios",
        // estilo texto
        tituloStyle: TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),

        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        iconColor: Color.fromARGB(255, 248, 214, 23),
      ),
      body: Column(
        children: [
          //busqueda y filtro
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 20, 20, 20),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                // borde normal
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),

                hintText: "Buscar cliente...",

                hintStyle: const TextStyle(
                  color: Color.fromARGB(224, 255, 241, 43),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(224, 255, 241, 43),
                ),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) async {
                setState(() {
                  cargando = false;
                  mensajeErrror = "";
                });
    
                filtroBusqueda = value;

                final respuesta = await ApiClientes.filtroBusqueda(value);

                print(respuesta);

                if (value == "") {
                  setState(() {
                    cargarClientes();
                  });
                }

                //comprobar si es sucess o no
                if (respuesta["success"] == true) {
                  setState(() {
                    clientes = List<Cliente>.from(
                      respuesta["datos"].map((e) => Cliente.fromJson(e)),
                    );
                    mensajeErrror="";
                    cargando = false;
                  });
                } else if (respuesta["success"] == false) {
                  setState(() {
                    clientes = [];
                    //cambiar el valor de la variable por el mensaje de la api
                    mensajeErrror = respuesta["error"];
                     cargando = false;
                  });
                }
              },
            ),
          ),


          //parte para el mensaje de error debajo del bsuca
          if (mensajeErrror.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                mensajeErrror,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          // lista clientes
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Color.fromARGB(255, 24, 23, 23)),

              child: cargando ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                itemCount: clientes.length,
                itemBuilder: (context, index) {
                  final cliente = clientes[index];

                  return Padding(
                    padding: const EdgeInsets.all(20),

                    // el sixedbox para dar tamaño o espacion entre cosas como en los Text field o tamaño a cada tarjeta
                    child: Center(
                      child: SizedBox(
                        width: 350,
                        child: Card(
                          color: const Color.fromARGB(255, 43, 41, 41),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            // padding a toda la targeta
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromARGB(
                                          255,
                                          248,
                                          214,
                                          23,
                                        ),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    size: 70,
                                    color: Color.fromARGB(255, 248, 214, 23),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  "${cliente.nombre} ${cliente.apellidos}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: 10),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      cliente.telefono,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        cliente.direccion,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.email,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        cliente.correo,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // espaciador
                                SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // botones de editar y borrar
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                "Confirmar eliminación",
                                              ),
                                              content: const Text(
                                                "¿Estás seguro de que deseas eliminar este cliente?",
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Cancelar"),
                                                ),
                                                TextButton(
                                                  //al pulsar en si llama a la funcion de eliminar
                                                  onPressed: () async {
                                                    print(cliente.code_user);
                                                    print(
                                                      "BORRAR CLIENTE ${cliente.code_user}",
                                                    );

                                                    ApiClientes.eliminarcliente(
                                                      cliente.code_user,
                                                    );
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      cargarClientes();
                                                    });
                                                  },

                                                  child: const Text("Aceptar"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        //print("BORRAR CLIENTE ${data[index].code_user}");
                                      },
                                      icon: const Icon(Icons.delete),
                                      label: const Text("Borrar"),

                                      style: ElevatedButton.styleFrom(
                                        iconColor: Colors.black,
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          248,
                                          214,
                                          23,
                                        ),

                                        foregroundColor: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                    ),

                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit),
                                      label: const Text("Editar"),
                                      style: ElevatedButton.styleFrom(
                                        iconColor: Colors.black,
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          248,
                                          214,
                                          23,
                                        ),
                                        foregroundColor: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 248, 214, 23),
        onPressed: () async {
          print("PULSADO pulsando");
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CrearClienteMongo()),
          );

          setState(() {
            cargarClientes();
          });
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
                  
      // boton flotante, en concreto este tiene un tamaño y padding fijos y no se puede modificar
      
  