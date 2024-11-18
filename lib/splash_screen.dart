import 'package:flutter/material.dart';
import 'home_screen.dart'; // Asegúrate de tener esta importación

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporizador para redirigir a HomeScreen después de 3 segundos
    Future.delayed(const Duration(seconds: 13), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo.jpg'), // Imagen de fondo
            fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png'), // Logo de la app
              const SizedBox(height: 20),
              const Text(
                'BIENVENIDO',
                style: TextStyle(
                              fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(color: Color.fromRGBO(78, 34, 145, 1)), // Indicador de carga
            ],
          ),
        ),
      ),
    );
  }
}
