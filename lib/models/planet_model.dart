// ignore_for_file: public_member_api_docs, sort_constructors_first

class PlanetModel {
  final String? id;
  final String? name;
  final bool? isPlanet;
  final double? density;
  final num? gravity;
  final double? radius;
  final int? temperature;
  final String? bodyType;
  final String? discoveryDate;
  final String? discoveredBy;
  final num? massValue;
  final int? massExponent;
  final num? volValue;
  final int? volExponent;

  PlanetModel({
    this.id,
    this.name,
    this.isPlanet,
    this.density,
    this.gravity,
    this.radius,
    this.temperature,
    this.bodyType,
    this.discoveryDate,
    this.discoveredBy,
    this.massValue,
    this.massExponent,
    this.volValue,
    this.volExponent,
  });

  factory PlanetModel.fromMap(Map<String, dynamic> json) {
    return PlanetModel(
      id: json['id'],
      name: json['englishName'],
      isPlanet: json['isPlanet'],
      density: json['density'] ?? "No information",
      gravity: json['gravity'] ?? "No information",
      radius: json['meanRadius'] ?? "No information",
      temperature: json['avgTemp'] ?? "No information",
      bodyType: json['bodyType'],
      discoveryDate: json['discoveryDate'] != ""
          ? json['discoveryDate']
          : "No information",
      discoveredBy:
          json['discoveredBy'] != "" ? json['discoveredBy'] : "No information",
      massValue: json["mass"]['massValue'] ?? "No information",
      massExponent: json["mass"]['massExponent'],
      volValue: json["vol"]['volValue'] ?? "No information",
      volExponent: json["vol"]['volExponent'],
    );
  }
}
