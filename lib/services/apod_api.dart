import 'dart:convert';
import 'package:http/http.dart' as http;

class PictureOfTheDayApi {
  static Future<Map<String, dynamic>> getApod() async {
    final response = await http.get(
      Uri.parse(
          "https://api.nasa.gov/planetary/apod?api_key=iOzbt9cIoM25ztYULcizCr0IdvrTfK4sDRktHP6r"),
    );
    print("Apod API Response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
