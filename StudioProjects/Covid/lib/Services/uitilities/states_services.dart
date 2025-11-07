import 'dart:convert';
import 'package:http/http.dart' as http;

class StateServices {
  // Countries list fetch karne ka method
  Future<List<dynamic>> fetchCountriesList() async {
    final url = Uri.parse('https://disease.sh/v3/covid-19/countries');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load countries');
    }
  }

  // World stats fetch karne ka method
  Future<Map<String, dynamic>> fetchWorldStats() async {
    final url = Uri.parse('https://disease.sh/v3/covid-19/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load world stats');
    }
  }
}
