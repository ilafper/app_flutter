import 'package:flutter/material.dart';
import 'home_mongo.dart';
import 'sql.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrimeraVista(),
    );
  }
}



// guardar la opcion
class PrimeraVista extends StatefulWidget  {
  const PrimeraVista({super.key});

  @override
  State<PrimeraVista> createState()=> Selector();

}

// donde se guarda lo que el usuario escoge

class Selector extends State<PrimeraVista>{
  String? seleccion;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //barra superior
      appBar: AppBar(title: const Text("Escoge la base de datos"),),
      //contenido principall
      body: Center(
        child: DropdownButton<String>(
          value: seleccion,
          hint: const Text("Elige una opcion"),
          
          // lista de opciones disponibles
          items: [
            DropdownMenuItem(
            value:"MongoDB", 
            child: Text("Ir a mongo")),
            DropdownMenuItem(
            value:"SQL", 
            child: Text("Ir a sql"))
          ],
          onChanged: (value) {
            setState(() {
            seleccion=value;
            });

            if(value== 'MongoDB'){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Mongo_Home(),
                ),
              );
          } else if(value == 'SQL'){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const sql_Home(),
                ),
              );
          }
          }
          

          
        ),
      ),
    );
  }
}

