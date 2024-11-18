import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agrofast/main.dart';  // Asegúrate de que el nombre del archivo sea correcto
import 'package:agrofast/home_screen.dart';
import 'package:agrofast/camera_screen.dart';

void main() {
  testWidgets('SplashScreen navigates to HomeScreen', (WidgetTester tester) async {
    // Cargar la app
    await tester.pumpWidget(const FarmIntelApp());

    // Verificar si el logo está presente en el SplashScreen
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('BIENVENIDO'), findsOneWidget);

    // Simular la espera del SplashScreen (10 segundos)
    await tester.pumpAndSettle(const Duration(seconds: 10));

    // Verificar que después de 10 segundos la pantalla ha navegado a HomeScreen
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('HomeScreen has button to navigate to CameraScreen', (WidgetTester tester) async {
    // Cargar la HomeScreen
    await tester.pumpWidget(const FarmIntelApp());

    // Verificar que el botón de la cámara esté presente
    expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    expect(find.text('Tomar Foto'), findsOneWidget);

    // Simular un toque en el botón para navegar a CameraScreen
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verificar que la pantalla de la cámara está presente
    expect(find.byType(CameraScreen), findsOneWidget);
  });

  testWidgets('CameraScreen shows CameraPreview', (WidgetTester tester) async {
    // Cargar la CameraScreen
    await tester.pumpWidget(const FarmIntelApp());

    // Navegar a la CameraScreen
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verificar que se muestra la vista previa de la cámara
    expect(find.byType(CameraPreview), findsOneWidget);
  });

  testWidgets('ResultScreen displays image and text', (WidgetTester tester) async {
    // Crear una ruta con un argumento de imagen (simular la navegación)
    final String imagePath = 'path/to/image.jpg';

    await tester.pumpWidget(const FarmIntelApp());

    // Navegar a ResultScreen pasando el argumento de la imagen
    await tester.pushNamed('/result', arguments: imagePath);

    // Verificar que la imagen se muestra en ResultScreen
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Procesando análisis...'), findsOneWidget);
  });
}

extension on WidgetTester {
  pushNamed(String s, {required String arguments}) {}
}
