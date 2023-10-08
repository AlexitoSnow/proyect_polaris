import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/views/planet_position.dart';

import '../constants.dart';

/// Displays detailed information about a SampleItem.
class DestinationsView extends StatelessWidget {
  const DestinationsView({super.key, this.launchAlert = false});

  final bool launchAlert;
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        /*appBar: AppBar(
          title: const Text('Planet Tourism '),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 84, 233, 89),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          titleSpacing: 0.5,
        ),*/
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('${pathImages}planets/emptyback.png'),
              fit: BoxFit.fill),
        ),
        width: width,
        child: launchAlert
            ? const SnackBar(
                content: Text('Site not found'),
                duration: Duration(seconds: 3),
              )
            : null,
      ),
      PlanetPosition(
          posX: width * 0.23,
          posY: height * 0.43,
          size: 80,
          pathImage: "${pathPlanets}mercury.png",
          name: 'Mercury'),
      PlanetPosition(
          posX: width * 0.30,
          posY: height * 0.25,
          size: 85,
          pathImage: "${pathPlanets}venus.png",
          name: 'Venus'),
      PlanetPosition(
          posX: width * 0.43,
          posY: height * 0.43,
          size: 85,
          pathImage: "${pathPlanets}earth.png",
          name: 'Earth'),
      PlanetPosition(
        posX: width * 0.50,
        posY: height * 0.25,
        size: 75,
        pathImage: "${pathPlanets}mars.png",
        name: 'Mars',
      ),
      PlanetPosition(
          posX: width * 0.60,
          posY: height * 0.43,
          size: 95,
          pathImage: "${pathPlanets}jupiter.png",
          name: 'Jupiter'),
      PlanetPosition(
        posX: width * 0.70,
        posY: height * 0.25,
        size: 130,
        pathImage: "${pathPlanets}saturn.png",
        name: 'Saturn',
      ),
      PlanetPosition(
        posX: width * 0.77,
        posY: height * 0.55,
        size: 90,
        pathImage: "${pathPlanets}uranus.png",
        name: 'Uranus',
      ),
      PlanetPosition(
        posX: width * 0.90,
        posY: height * 0.33,
        size: 65,
        pathImage: "${pathPlanets}neptune.png",
        name: 'Neptune',
      )
    ]));
  }
}
