import 'package:flutter/material.dart';
import 'apiService/api.dart';
import 'package:app_flutter/models/cliente.dart';

class Mongo_Home extends StatefulWidget {
  const Mongo_Home({super.key});

  @override
  State<Mongo_Home> createState() => _Mongo_HomeState();
}

class _Mongo_HomeState extends State<Mongo_Home> {
  late Future<List<Cliente>> clientes;

  @override
  void initState() {
    super.initState();
    print("INITSTATE EJECUTADO");
    clientes = ApiClientes.getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Vista Mongo"),
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
                ),

                
                hintText: "Buscar cliente...",
                hintStyle: const TextStyle(color: Color.fromARGB(224, 255, 241, 43)),
                prefixIcon: const Icon(Icons.search, color:  Color.fromARGB(224, 255, 241, 43)),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                color: Color.fromARGB(255, 24, 23, 23),
              ),
              child: FutureBuilder<List<Cliente>>(
                future: clientes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text("Error cargando datos"));
                  }

                  final data = snapshot.data!;

                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(data.length, (index) {
                        return SizedBox(
                          width: 300,
                          child: Card(
                            color: const Color.fromARGB(255, 27, 27, 27),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              // padding a toda la targeta
                              padding: const EdgeInsets.all(15),
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
                                    "${data[index].nombre} ${data[index].apellidos}",
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
                                        data[index].telefono,
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
                                          data[index].direccion,
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
                                          data[index].correo,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {},
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
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
