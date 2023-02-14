import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stellar_scope/models/planet_model.dart';

class SearchApi {
  static Future<List<dynamic>> getAllData() async {
    final response = await http.get(
      Uri.parse("https://api.le-systeme-solaire.net/rest/bodies/"),
    );
    print("Search API Response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> planets = data["bodies"];
      return planets;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
