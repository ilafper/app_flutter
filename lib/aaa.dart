import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'index.dart';

void main() {
  runApp(const inicio());
}

class inicio extends StatelessWidget {
  const inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InicioView(),
    );
  }
}

class InicioView extends StatelessWidget {
  const InicioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Center(
        child: ClipPath(
          // tamaño
          clipper:MiClipper () ,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Tu agenda te espera",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 214, 23),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  print("Entrar");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
                child: const Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//clase para el custom painter

class MiClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path();

    path.moveTo(0, size.height * 0.8);

    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
