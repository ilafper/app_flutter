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
        child: CustomPaint(
          // tamaño
          size: const Size(1080, 2340),
          painter: lienzo(),

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
              SizedBox(
                width: 150,
                child: ElevatedButton(
                onPressed: () {
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                  
                },
                child: const Text("Entrar" , style:const  TextStyle(
                  fontSize: 17
                )),
                
                
                style: ElevatedButton.styleFrom(
                 
                  iconColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 248, 214, 23),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                
              ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

//clase para el custom painter

class lienzo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 248, 214, 23)
      //relleno de la forma
      ..style = PaintingStyle.fill;

    // circulo
    canvas.drawCircle(Offset(size.width / 90, size.height / 19), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
