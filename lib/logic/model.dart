import 'dart:convert';

// https://zoo-animal-api.herokuapp.com/animals/rand/10
List<Animal> animalsListFromJson(String str) =>
    List<Animal>.from(json.decode(str).map((x) => Animal.fromJson(x)));
String animalsListToJson(List<Animal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// https://zoo-animal-api.herokuapp.com/animals/rand
Animal animalFromJson(String str) => Animal.fromJson(json.decode(str));
String animalToJson(Animal data) => json.encode(data.toJson());

class Animal {
  Animal({
    required this.name,
    required this.latinName,
    required this.animalType,
    required this.activeTime,
    required this.lengthMin,
    required this.lengthMax,
    required this.weightMin,
    required this.weightMax,
    required this.lifespan,
    required this.habitat,
    required this.diet,
    required this.geoRange,
    required this.imageLink,
    required this.id,
  });

  String name;
  String latinName;
  String animalType;
  String activeTime;
  String lengthMin;
  String lengthMax;
  String weightMin;
  String weightMax;
  String lifespan;
  String habitat;
  String diet;
  String geoRange;
  String imageLink;
  int id;

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        name: json["name"],
        latinName: json["latin_name"],
        animalType: json["animal_type"],
        activeTime: json["active_time"],
        lengthMin: json["length_min"],
        lengthMax: json["length_max"],
        weightMin: json["weight_min"],
        weightMax: json["weight_max"],
        lifespan: json["lifespan"],
        habitat: json["habitat"],
        diet: json["diet"],
        geoRange: json["geo_range"],
        imageLink: json["image_link"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "latin_name": latinName,
        "animal_type": animalType,
        "active_time": activeTime,
        "length_min": lengthMin,
        "length_max": lengthMax,
        "weight_min": weightMin,
        "weight_max": weightMax,
        "lifespan": lifespan,
        "habitat": habitat,
        "diet": diet,
        "geo_range": geoRange,
        "image_link": imageLink,
        "id": id,
      };

  Animal copyWith({
    String? name,
    String? latinName,
    String? animalType,
    String? activeTime,
    String? lengthMin,
    String? lengthMax,
    String? weightMin,
    String? weightMax,
    String? lifespan,
    String? habitat,
    String? diet,
    String? geoRange,
    String? imageLink,
    int? id,
  }) {
    return Animal(
      name: name ?? this.name,
      latinName: latinName ?? this.latinName,
      animalType: animalType ?? this.animalType,
      activeTime: activeTime ?? this.activeTime,
      lengthMin: lengthMin ?? this.lengthMin,
      lengthMax: lengthMax ?? this.lengthMax,
      weightMin: weightMin ?? this.weightMin,
      weightMax: weightMax ?? this.weightMax,
      lifespan: lifespan ?? this.lifespan,
      habitat: habitat ?? this.habitat,
      diet: diet ?? this.diet,
      geoRange: geoRange ?? this.geoRange,
      imageLink: imageLink ?? this.imageLink,
      id: id ?? this.id,
    );
  }
}
