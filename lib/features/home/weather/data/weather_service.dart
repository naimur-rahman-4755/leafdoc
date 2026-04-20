import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leafdoc/features/home/weather/data/weather_model.dart';

class WeatherService {
  static const String _apiKey = 'ce8cc8fb013415c158660decde382f08';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel> fetchWeather({
    required double lat,
    required double lon,
  }) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'appid': _apiKey,
        'units': 'metric',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'Weather API failed (${response.statusCode})',
      );
    }

    final Map<String, dynamic> jsonMap = json.decode(response.body);
    return WeatherModel.fromJson(jsonMap);
  }
}
