// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

class PlanetModel {
  final String? id;
  final String? name;
  final bool? isPlanet;
  final double? density;
  final double? gravity;
  final double? radius;
  final int? temperature;
  final String? bodyType;
  final String? discoveryDate;
  final String? discoveryBy;
  final double? massValue;
  final int? massExponent;
  final double? volVolume;
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
    this.discoveryBy,
    this.massValue,
    this.massExponent,
    this.volVolume,
    this.volExponent,
  });

  factory PlanetModel.fromMap(Map<String, dynamic> json) {
    return PlanetModel(
      id: json['id'],
      name: json['englishName'],
      isPlanet: json['isPlanet'],
      density: json['density'],
      gravity: json['gravity'],
      radius: json['meanRadius'],
      temperature: json['avgTemp'],
      bodyType: json['bodyType'],
      discoveryDate: json['discoveryDate'],
      discoveryBy: json['discoveryBy'],
      massValue: json["mass"]['massValue'],
      massExponent: json["mass"]['massExponent'],
      volVolume: json["vol"]['volVolume'],
      volExponent: json["vol"]['volExponent'],
    );
  }
}
