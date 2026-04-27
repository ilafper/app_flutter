import 'package:flutter/material.dart';
import 'home_mongo.dart';
import 'sql.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      scaffoldBackgroundColor: const Color(0xFF2A2A2A),
  ),
      home: PrimeraVista());
  }
}

// guardar la opcion
class PrimeraVista extends StatefulWidget {
  const PrimeraVista({super.key});

  @override
  State<PrimeraVista> createState() => Selector();
}

// donde se guarda lo que el usuario escoge
class Selector extends State<PrimeraVista> {
  String? seleccion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2A2A),

      //barra superior
      //contenido principall
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Selecciona una base de datos",
                // centrar el texto
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 224, 48),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // boton de seleccion
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              // color base
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 224, 48),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: seleccion,
                dropdownColor: const Color.fromARGB(255, 255, 224, 48),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                //icono flecha
                iconEnabledColor: const Color.fromARGB(255, 0, 0, 0),
                underline: const SizedBox(), // quita la línea fea
                items: const [
                  DropdownMenuItem(value: "MongoDB", child: Text("Ir a mongo")),
                  DropdownMenuItem(value: "SQL", child: Text("Ir a sql")),
                ],
                onChanged: (value) {
                  setState(() {
                    seleccion = value;
                  });
                  if (value == 'MongoDB') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Mongo_Home(),
              ),
            );
          } else if (value == 'SQL') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const sql_Home(),
              ),
            );
          }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
