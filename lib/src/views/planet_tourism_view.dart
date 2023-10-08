import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/constants.dart';
import 'dart:convert';
import '../model/planet.dart';
import 'destinations_view.dart';
import 'package:flutter/services.dart' show rootBundle;

class PlanetTourismView extends StatelessWidget {
  const PlanetTourismView({
    super.key,
    required this.name,
  });

  static const routeName = '/planet/tourism-places';

  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism at $name'),
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
      floatingActionButton: OutlinedButton(
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
      body: FutureBuilder<TourismPlace>(
        future: loadTourismDetails(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final TourismPlace place = snapshot.data!;
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
                      '${pathImages}speaker.jpeg',
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
                    child: SelectableText(place.name)),
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
                      child: SelectableText('${place.activities}')),
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

  Future<TourismPlace> loadTourismDetails(String name) async {
    final String tourismJSON =
        await rootBundle.loadString('assets/docs/activities_per_planet.json');
    final Map<String, dynamic> jsonData = json.decode(tourismJSON);
    final List<TourismPlace> places = jsonData[name].map((place) {
      return TourismPlace(
        name: place['name'],
        activities: List<String>.from(place['activities']),
      );
    }).toList();
    print("LUGARES");
    print(places);
    final TourismPlace tourism =
        places.firstWhere((place) => place.name == name);
    return tourism;
  }
}
