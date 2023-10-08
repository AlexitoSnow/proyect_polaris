import 'package:flutter/material.dart';

class PlanetPosi extends StatelessWidget {
  final double posX;
  final double posY;

  final double size;
  final String pathImage;
  const PlanetPosi({
    required this.posX,
    required this.posY,
    required this.size,
    required this.pathImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: posX,
      top: posY,
      child: GestureDetector(
        onTap: () {
          // Ejecutar algo cuando se toque en la ubicación específica
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Tocaste en la ubicación deseada'),
                content: const Text('Aquí puedes ejecutar tu acción deseada.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cerrar'),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          width: size, // Ancho del área interactiva
          height: size, // Alto del área interactiva
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
