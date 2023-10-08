import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/recursos/pos_planeta.dart';

/// Displays detailed information about a SampleItem.
class Intro extends StatelessWidget {
  const Intro({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  image: AssetImage('assets/images/planets/emptyback.png'),
                  fit: BoxFit.fill),
            ),
            width: width,
          ),

          //planet1
          PlanetPosi(
            posX: width * 0.23,
            posY: height * 0.43,
            size: 80,
            pathImage: "assets/images/onlyplanets/mercurio.png",
          ),
          //planet2
          PlanetPosi(
            posX: width * 0.30,
            posY: height * 0.25,
            size: 85,
            pathImage: "assets/images/onlyplanets/venus.png",
          ),
          //planet3
          PlanetPosi(
            posX: width * 0.43,
            posY: height * 0.43,
            size: 85,
            pathImage: "assets/images/onlyplanets/tierra2.png",
          ),

          //planet 4
          PlanetPosi(
            posX: width * 0.50,
            posY: height * 0.25,
            size: 75,
            pathImage: "assets/images/onlyplanets/marte.png",
          ),

          //planet 5

          PlanetPosi(
            posX: width * 0.60,
            posY: height * 0.43,
            size: 95,
            pathImage: "assets/images/onlyplanets/jupiter.png",
          ),

          //planet 6

          PlanetPosi(
            posX: width * 0.70,
            posY: height * 0.25,
            size: 130,
            pathImage: "assets/images/onlyplanets/saturno.png",
          ),
          //planet 7
          PlanetPosi(
            posX: width * 0.77,
            posY: height * 0.55,
            size: 90,
            pathImage: "assets/images/onlyplanets/urano.png",
          ),

          //planet 8

          PlanetPosi(
            posX: width * 0.90,
            posY: height * 0.33,
            size: 65,
            pathImage: "assets/images/onlyplanets/neptuno.png",
          )
        ]));
  }
}
