import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/model/planet.dart';

const pathImages = 'assets/images/';

const pathPlanets = 'assets/images/onlyplanets/';

const pathPlanetImages = 'assets/images/planets/';

const pathJSONFiles = 'assets/docs/';

const Map<String, Color> colorPalette = {
  'Green': Color.fromARGB(181, 182, 234, 218),
  'Blue': Color.fromARGB(255, 91, 143, 185),
  'Purple': Color.fromARGB(255, 48, 30, 103),
  'DarkGreen': Color.fromARGB(255, 3, 0, 28)
};

Widget speakerWidget(double parentWidth, double parentHeight) {
  var scaleWidth =
      parentWidth > parentHeight ? parentWidth / 9 : parentWidth / 7;
  var scaleHeight =
      parentWidth < parentHeight ? parentWidth / 7 : parentWidth / 9;
  return Positioned(
      bottom: 0,
      left: 0,
      width: scaleWidth,
      height: scaleHeight,
      child: ClipOval(
        child: Image.asset(
          '${pathImages}speaker.jpeg',
          fit: BoxFit.cover,
        ),
      ));
}

TourismPlace emptyPlace = TourismPlace(name: 'default', places: [
  Place(name: "", information: "", activities: [""], imageName: '')
]);

TourismPlace marsPlaces = TourismPlace(name: 'Mars', places: [
  Place(
      name: "Marker Band Valley",
      information:
          "This map shows the route NASA's Curiosity Mars rover took from May into July 2023 to complete the most difficult climb of the mission. Starting in Marker Band Valley (the darker area at the top center), the route shows white dots for each stop the rover made. As it struggled to crest a 23-degree slope covered with slippery sand and wheel-size rocks, the rover experienced a number of faults that stopped it mid-drive. That area can be seen just below the center of the image, where a cluster of the white dots bunch up.",
      activities: ["Mountaineering"],
      imageName: 'markerbandvalley.jpg'),
  Place(
      name: "Collapsing Volcano; Edge of Olympus Mons",
      information:
          "The northern edge of the largest volcano in the solar system is Olympus Mons on Mars. The margin of Olympus Mons is defined by a massive cliff many kilometers (several miles) tall. At this location, it is nearly 7 kilometers (23,000 feet) tall. The cliff exposes the guts of the volcano, revealing interbedded hard and soft layers. The hard layers are lava and the soft layers may be dust (from large dust storms) or volcanic ash.",
      activities: [
        "take photos from afar, be able to contemplate a beautiful landscape"
      ],
      imageName: 'olympusmons.jpg'),
  Place(
      name: "Valles Marineris",
      information:
          "A color image of Valles Marineris, the great canyon of Mars; north toward top. The scene shows the entire canyon system, over 3,000 km long and averaging 8 km deep, extending from Noctis Labyrinthus, the arcuate system of graben to the west, to the chaotic terrain to the east.",
      activities: ["Hiking and Excursionism"],
      imageName: 'vallesmarineris.jpg'),
]);
