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
          backgroundColor: colorPalette['Blue'],
          title: Text('Tourism at $name'),
          actions: [
            IconButton(
              tooltip: 'Go to Solar System',
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, DestinationsView.routeName);
              },
            ),
          ],
        ),
        floatingActionButton: buttons(context),
        body: informationWidget(width, height));
  }

  OutlinedButton buttons(var context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          foregroundColor: Colors.white,
          backgroundColor: colorPalette['Blue'],
          side: const BorderSide(color: Colors.white, width: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        onPressed: () {},
        child: const SizedBox(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Despeguemos!',
                style: TextStyle(fontSize: 14),
              ),
              Icon(
                Icons.rocket_launch,
                size: 14,
              ),
            ],
          ),
        ));
  }

  Widget informationWidget(var width, var height) {
    return FutureBuilder<TourismPlace>(
      future: loadTourismDetails(name),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final TourismPlace place = snapshot.data!;
          return Stack(
            children: [
              SizedBox(
                  width: width,
                  height: height,
                  child: Image.asset(
                    "$pathPlanetImages/${name.toLowerCase()}/${name.toLowerCase()}.jpg",
                    fit: BoxFit.cover,
                    // Si no se encuentra la imagen, se muestra el logo
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/logo.png",
                          fit: BoxFit.cover);
                    },
                  )),
              speakerWidget(width, height),
              Container(
                  width: width * 0.4,
                  height: height * 0.5,
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: colorPalette['Green'],
                  ),
                  child: SelectableText(place.places[0].name)),
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
                    child: SelectableText('${place.places}')),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
          //return const CircularProgressIndicator();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<TourismPlace> loadTourismDetails(String name) async {
    final String planetsJSON = await rootBundle
        .loadString('${pathJSONFiles}activities_per_planet.json');
    final List<dynamic> jsonData = json.decode(planetsJSON);
    final List<TourismPlace> places = jsonData.map((place) {
      return TourismPlace(
        name: place['Name'],
        // Hay que hacer que esto se obtenga los diccionarios
        places: place['activities']
            .map((activity) => Place(
                  name: activity['name'],
                  information: activity['information'],
                  activities: activity['activities'].cast<String>(),
                ))
            .toList(),
      );
    }).toList();
    final TourismPlace tourismPlace =
        places.firstWhere((place) => place.name == name);
    print('here');
    print(tourismPlace);
    return tourismPlace;
  }
}
