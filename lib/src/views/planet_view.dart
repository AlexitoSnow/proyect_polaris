import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/planet.dart';
import 'destinations_view.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'planet_tourism_view.dart';

class PlanetView extends StatelessWidget {
  const PlanetView({
    super.key,
    required this.name,
  });

  static const routeName = '/planet';

  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, DestinationsView.routeName);
            },
          ),
        ],
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  side: const BorderSide(color: Colors.white, width: 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () {},
                child: Container(
                  width: 150,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Despeguemos!'),
                      Icon(Icons.rocket_launch),
                    ],
                  ),
                )),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  side: const BorderSide(color: Colors.white, width: 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanetTourismView(
                        name: name,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lugares!'),
                      Icon(Icons.rocket_launch),
                    ],
                  ),
                )),
          ]),
      body: FutureBuilder<Planet>(
        future: loadPlanetDetails(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Planet planet = snapshot.data!;
            return Stack(
              children: [
                Container(
                    color: Colors.red,
                    width: width,
                    height: height,
                    child: Image.asset(
                      "assets/images/planets/${name.toLowerCase()}/${name.toLowerCase()}.jpg",
                      fit: BoxFit.cover,
                      // Si no se encuentra la imagen, se muestra el logo
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/images/logo.png",
                            fit: BoxFit.cover);
                      },
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    width: width > height ? width / 7 : width / 5,
                    height: width < height ? width / 5 : width / 7,
                    child: Image.asset(
                      'assets/images/speaker.jpeg',
                      fit: BoxFit.cover,
                    )),
                Container(
                    width: width * 0.4,
                    height: height * 0.5,
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(169, 88, 165, 123),
                    ),
                    child: SelectableText(planet.characteristics)),
                Positioned(
                  right: width * 0.01,
                  child: Container(
                      width: width * 0.2,
                      height: height * 0.5,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(169, 88, 165, 123),
                      ),
                      child: SelectableText(
                          '${planet.structure}\n${planet.clothing}')),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const CircularProgressIndicator();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<Planet> loadPlanetDetails(String name) async {
    final String planetsJSON =
        await rootBundle.loadString('assets/docs/planets_details.json');
    final List<dynamic> jsonData = json.decode(planetsJSON);
    final List<Planet> planets = jsonData.map((planet) {
      return Planet(
        name: planet['Name'],
        characteristics: planet['Characteristics'],
        structure: planet['Structure'],
        clothing: planet['Clothing'],
      );
    }).toList();
    final Planet planet = planets.firstWhere((planet) => planet.name == name);
    return planet;
  }
}
