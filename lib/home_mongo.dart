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
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
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
              print("asdasdajsdbAKSJLDaksdASHLDaksjdKASJDlasdAKSD");
              print("DATA LENGTH: ${data.length}");
              
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(data[index].nombre),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}