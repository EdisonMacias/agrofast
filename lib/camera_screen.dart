import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Inicializar la cámara con manejo de permisos
  Future<void> _initializeCamera() async {
    final cameraStatus = await Permission.camera.request();

    if (cameraStatus.isGranted) {
      _cameras = await availableCameras();
      _controller = CameraController(_cameras[0], ResolutionPreset.high);

      // Inicializar el controlador de la cámara y manejar el estado
      await _controller.initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _isCameraReady = true;
        });
      }).catchError((error) {
        if (!mounted) return;
        _showErrorDialog('Error al inicializar la cámara: $error');
      });
    } else {
      _showErrorDialog('Necesitamos acceso a la cámara para tomar fotos.');
    }
  }

  // Mostrar un mensaje de error con un Dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tomar Foto'),
      ),
      body: _isCameraReady
          ? CameraPreview(_controller)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
