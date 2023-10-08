import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/views/location_view.dart';
import 'package:proyect_polaris/src/views/object_space_position.dart';
import 'package:proyect_polaris/src/views/planet_position.dart';

import '../constants.dart';

/// Displays detailed information about a SampleItem.
class DestinationsView extends StatefulWidget {
  const DestinationsView({super.key, this.launchAlert = false});

  final bool launchAlert;
  static const routeName = '/';

  @override
  State<DestinationsView> createState() => _DestinationsViewState();
}

class _DestinationsViewState extends State<DestinationsView> {
  bool isTravelButtonClicked = false;

  bool isTravelItenerary = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ButtonStyle btnSelect = ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(192, 33, 149, 243),
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24));

    ButtonStyle btnChoose = ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(192, 159, 49, 250),
        foregroundColor: Color.fromARGB(255, 52, 240, 193),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24));

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
      ),
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 160,
            ),
            Visibility(
              visible: isTravelItenerary,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(192, 33, 149, 243),
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LocationPage.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 17, bottom: 17),
                    child: Text('Travel Itinerary'),
                  )),
            ),
            const SizedBox(
              height: 530,
            ),
            ElevatedButton(
                style: isTravelButtonClicked ? btnChoose : btnSelect,
                onPressed: () {
                  setState(() {
                    isTravelButtonClicked = !isTravelButtonClicked;
                    isTravelItenerary = !isTravelItenerary;
                  });
                  final snackBar = SnackBar(
                    content: Center(
                        child: Text(
                      isTravelButtonClicked
                          ? 'W E L C O M E'
                          : 'C H O O S E  T H E  P L A N E T',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.black,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 14, bottom: 14),
                  child: Text(isTravelButtonClicked
                      ? 'Choose a planet to review its attractions'
                      : 'Select travel destination'),
                )),
          ],
        ),
      ),
      PlanetPosition(
          posX: width * 0.23,
          posY: height * 0.43,
          size: 90,
          pathImage: "${pathPlanets}mercury.png",
          name: 'Mercury'),
      //planetas

      PlanetPosition(
          posX: width * 0.30,
          posY: height * 0.25,
          size: 95,
          pathImage: "${pathPlanets}venus.png",
          name: 'Venus'),
      PlanetPosition(
          posX: width * 0.43,
          posY: height * 0.43,
          size: 95,
          pathImage: "${pathPlanets}earth.png",
          name: 'Earth'),
      PlanetPosition(
        posX: width * 0.50,
        posY: height * 0.25,
        size: 80,
        pathImage: "${pathPlanets}mars.png",
        name: 'Mars',
      ),
      PlanetPosition(
          posX: width * 0.60,
          posY: height * 0.43,
          size: 100,
          pathImage: "${pathPlanets}jupiter.png",
          name: 'Jupiter'),
      PlanetPosition(
        posX: width * 0.70,
        posY: height * 0.25,
        size: 155,
        pathImage: "${pathPlanets}saturn.png",
        name: 'Saturn',
      ),
      PlanetPosition(
        posX: width * 0.77,
        posY: height * 0.55,
        size: 100,
        pathImage: "${pathPlanets}uranus.png",
        name: 'Uranus',
      ),
      PlanetPosition(
        posX: width * 0.90,
        posY: height * 0.33,
        size: 70,
        pathImage: "${pathPlanets}neptune.png",
        name: 'Neptune',
      ),

      ObjectPosition(
        posX: width * 0.40,
        posY: height * 0.42,
        size: 30,
        pathImage: "${pathPlanets}moon.png",
        name: 'Moon',
        description:
            "Earth's Moon is the only place beyond Earth where humans have set foot.The brightest and largest object in our night sky, the Moon makes Earth a more livable planet by moderating our home planet's wobble on its axis, leading to a relatively stable climate. It also causes tides, creating a rhythm that has guided humans for thousands of years.Our moon is the fifth largest of the 190+ moons orbiting planets in our solar system.",
      ),

      //objectos

      ObjectPosition(
        posX: width * 0.49,
        posY: height * 0.42,
        size: 40,
        pathImage: "${pathPlanets}satelitenasa.png",
        name: "satelite",
        description:
            "The NASA's Lunar Flashlight satellite, launched in November 2022, has the primary objective of finding ice on the surface of the Moon, specifically in the darkest regions of the lunar South Pole. To achieve this, it uses a reflectometer with four lasers that emit near-infrared light, which is absorbed by ice. If the light is absorbed instead of being reflected, it indicates the presence of frozen water. The data collected will be used to understand the distribution of ice on the Moon and its potential utility for future lunar exploration missions.",
      )
    ]));
  }
}
