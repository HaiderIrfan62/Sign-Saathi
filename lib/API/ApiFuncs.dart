import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getterAPI(String url) async {
  final apiUrl = Uri.parse(url);

  try {
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      return jsonData;
    } else {
      throw Exception('Failed to load data from the API. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

