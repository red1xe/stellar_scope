import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stellar_scope/models/planet_model.dart';

class PlanetInfoApi {
  static Future<List<PlanetModel>> getDataByQuery({required String q}) async {
    final response = await http.get(
      Uri.parse("https://api.le-systeme-solaire.net/rest/bodies/$q"),
    );
    print("Response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return [PlanetModel.fromMap(data)];
    } else {
      throw Exception("Failed to load data");
    }
  }
}
