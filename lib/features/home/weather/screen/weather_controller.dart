import 'package:flutter/material.dart';
import '../data/weather_model.dart';
import '../data/weather_service.dart';
import '../domain/location_services.dart';

class WeatherController extends ChangeNotifier {
  final WeatherService _weatherService;
  final LocationService _locationService;

  WeatherController(
      this._weatherService,
      this._locationService,
      );

  WeatherModel? _weather;
  bool _isLoading = false;
  String? _error;

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadWeather() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final position = await _locationService.getCurrentLocation();

      _weather = await _weatherService.fetchWeather(
        lat: position.latitude,
        lon: position.longitude,
      );
    } catch (e) {
      _error = e.toString().replaceAll('Exception:', '').trim();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
