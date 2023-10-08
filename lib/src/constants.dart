import 'package:flutter/material.dart';

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
