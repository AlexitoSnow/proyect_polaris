import 'package:flutter/material.dart';

class TierraApp extends StatelessWidget {
  const TierraApp({super.key});

  static const routeName = '/tierra';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagen de Fondo con Tocar en Lugar Específico'),
      ),
      body: const Center(child: Text('Hola')),
    );
  }
}
