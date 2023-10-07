import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/sample_feature/tierra_page.dart';

/// Displays detailed information about a SampleItem.
class Intro extends StatelessWidget {
  const Intro({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('🌍 Planet Tourism '),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 84, 233, 89),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          titleSpacing: 0.5,
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/planets/planetary_tourism.jpeg'),
                  fit: BoxFit.fill),
            ),
            width: width,
          ),
          const ContainerPos(ubicacionX: 830.0, ubicacionY: 410.0)
        ]));
  }
}

class ContainerPos extends StatelessWidget {
  const ContainerPos({
    super.key,
    required this.ubicacionX,
    required this.ubicacionY,
  });

  final double ubicacionX;
  final double ubicacionY;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ubicacionX,
      top: ubicacionY,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TierraApp(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent),
          width: 60.0, // Ancho del área interactiva
          height: 60.0, // Alto del área interactiva
        ),
      ),
    );
  }
}
