import 'package:flutter/material.dart';

import 'planet_view.dart';

class PlanetPosition extends StatelessWidget {
  final double posX;
  final double posY;

  final String name;
  final double size;
  final String pathImage;
  const PlanetPosition({
    required this.posX,
    required this.posY,
    required this.size,
    required this.pathImage,
    required this.name,
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
          Navigator.pushReplacementNamed(
              context, '${PlanetView.routeName}/$name');
        },
        child: Tooltip(
          message: name,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
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
        ),
      ),
    );
  }
}
