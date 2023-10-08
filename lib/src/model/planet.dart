class Planet {
  final String name;
  final String characteristics;
  final String structure;
  final String clothing;

  Planet({
    required this.name,
    required this.characteristics,
    required this.structure,
    required this.clothing,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Planet && other.name == name;
  }
}

class TourismPlace {
  final String name;
  final List<Place> places;

  TourismPlace({required this.name, required this.places});
}

class Place {
  final String name;
  final String information;
  final List<String> activities;

  Place(
      {required this.name,
      required this.information,
      required this.activities});
}
