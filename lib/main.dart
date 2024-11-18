import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'camera_screen.dart';
import 'result_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(const FarmIntelApp());
}

class FarmIntelApp extends StatelessWidget {
  const FarmIntelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmIntel',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Redirige primero al SplashScreen
        '/home': (context) => const HomeScreen(),
        '/camera': (context) => const CameraScreen(),
        '/result': (context) => const ResultScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
