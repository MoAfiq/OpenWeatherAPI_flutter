import 'package:http/http.dart' as http;
import '../models/weather_models.dart';

class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '90332c95bf23596c86134546aeaf2c30';
    final Uri url = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather',
        queryParameters: {'q': cityName, 'appId': apiKey, 'Units': 'Metric'});

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load whether information.');
    }
  }
}
