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
  final List<String> activities;

  TourismPlace({required this.name, required this.activities});
}
