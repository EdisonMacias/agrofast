import 'dart:io';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener la ruta de la imagen desde los argumentos
    final String? imagePath = ModalRoute.of(context)?.settings.arguments as String?;

    // Verificar si la ruta es válida
    if (imagePath == null || !File(imagePath).existsSync()) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Resultado de la Imagen'),
        ),
        body: const Center(
          child: Text(
            'No se encontró la imagen.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    // Si la ruta es válida, mostrar la imagen
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado de la Imagen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(
            File(imagePath),
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            'Procesando análisis...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
