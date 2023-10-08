import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/constants.dart';
import 'dart:convert';
import '../model/planet.dart';
import 'destinations_view.dart';
import 'package:flutter/services.dart' show rootBundle;

class PlanetTourismView extends StatefulWidget {
  const PlanetTourismView({
    super.key,
    required this.name,
  });

  static const routeName = '/planet/tourism-places';

  final String name;

  @override
  State<PlanetTourismView> createState() => _PlanetTourismViewState();
}

class _PlanetTourismViewState extends State<PlanetTourismView> {
  int placeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorPalette['Blue'],
          title: Text(marsPlaces.places[placeIndex].name),
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
                "Let's take off!",
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
    return Stack(
      children: [
        SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              "$pathPlanetImages/${widget.name.toLowerCase()}/${marsPlaces.places[placeIndex].imageName}",
              fit: BoxFit.cover,
              // Si no se encuentra la imagen, se muestra el logo
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("${pathImages}logo.png", fit: BoxFit.cover);
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SelectableText(
                    'Before this exciting adventure, we must learn a little...',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SelectableText(
                    'Information:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SelectableText(
                    marsPlaces.places[placeIndex].information,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SelectableText(
                    'Activities:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SelectableText(
                    marsPlaces.places[placeIndex].activities.join('\n'),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18),
                        foregroundColor: Colors.white,
                        backgroundColor: colorPalette['Blue'],
                        side: const BorderSide(color: Colors.white, width: 1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          print('en el boton');
                          print(marsPlaces.places[placeIndex].pathImage);
                          marsPlaces.places.length - 1 > placeIndex
                              ? placeIndex++
                              : placeIndex = 0;
                        });
                      },
                      child: const SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Seguir Explorando!',
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(
                              Icons.rocket_launch,
                              size: 14,
                            ),
                          ],
                        ),
                      ))
                ])),
      ],
    );
  }
}
