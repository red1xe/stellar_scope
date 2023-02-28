import 'dart:convert';
import 'package:http/http.dart' as http;

class BlueMarbleApi {
  static Future<List<dynamic>> getImage(String date) async {
    final response = await http.get(
      Uri.parse("https://epic.gsfc.nasa.gov/api/enhanced/date/$date"),
    );
    print("Blue Marble API Response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
