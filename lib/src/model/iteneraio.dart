import 'package:proyect_polaris/src/constants.dart';

class IteneraryModel {
  String name;
  String pathImage;
  List<String> hours;
  List<String> places;

  IteneraryModel(
      {required this.name,
      required this.pathImage,
      required this.hours,
      required this.places});

  static List<IteneraryModel> getIteneraries() {
    List<IteneraryModel> itenerarys = [];

    itenerarys.add(IteneraryModel(
        name: "Mars",
        pathImage: "${pathPlanets}mars.png",
        hours: [
          "07:00-08:00",
          "08:00-09:00",
          "09:00-:10:00"
        ],
        places: [
          "Monte Olimpio",
          "Volcanes Tharsis",
          "Valles Merineris",
        ]));

    itenerarys.add(IteneraryModel(
        name: "Jupiter",
        pathImage: "${pathPlanets}jupiter.png",
        hours: [
          "07:00-09:00",
          "09:00-10:00",
          "10:00-:12:00"
        ],
        places: [
          "Europa and I satellite",
          "Ganymede and Callisto satellites",
          "Red Spot",
        ]));

    itenerarys.add(IteneraryModel(
        name: "Mercury",
        pathImage: "${pathPlanets}mercury.png",
        hours: [
          "05:00-07:00",
          "07:00-09:00",
          "09:00-:10:00"
        ],
        places: [
          "Calorie count",
          "History and activities",
          "Return to Earth",
        ]));

    return itenerarys;
  }
}
