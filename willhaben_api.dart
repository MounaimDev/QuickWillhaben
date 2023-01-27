import 'package:http/http.dart' as http;
import 'dart:convert';

class WillhabenAPI {
  final String _baseUrl = 'https://api.willhaben.at/rest/marketplace/offers';
  final String _apiKey = 'YOUR_API_KEY';

  // Fetch data from Willhaben API
  Future<List<Offer>> fetchData() async {
    final response = await http.get(
      _baseUrl,
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<Offer> offers = jsonData.map((item) => Offer.fromJson(item)).toList();
      return offers;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

