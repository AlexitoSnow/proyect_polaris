import 'package:flutter/material.dart';

class ObjectPosition extends StatelessWidget {
  final double posX;
  final double posY;
  final String pathImage;
  final double size;
  final String name;
  final String description;

  const ObjectPosition({
    required this.posX,
    required this.posY,
    required this.size,
    required this.pathImage,
    required this.name,
    required this.description,
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
          // Ejecutar algo cuando se toque en la ubicación específica
          newMethod(context);
        },
        child: Tooltip(
          message: name,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: size, // Ancho del área interactiva
              height: size, // Alto del área interactiva
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(pathImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> newMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              name,
              style: const TextStyle(
                  color: Color.fromRGBO(91, 143, 185, 1), fontSize: 24),
            ),
          ),
          content: Text(
            description,
            style: const TextStyle(color: Color.fromRGBO(182, 234, 218, 1)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
