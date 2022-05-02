import 'package:flutter_application_1/api_secrets.dart';
import 'package:flutter_application_1/riverpod/src/models/weather.dart';
import 'package:flutter_application_1/riverpod/src/repositories/repository_interface.dart';
import 'package:weather/weather.dart' as package_api;

final externalApi = package_api.WeatherFactory(weatherApiKey);

class WeatherRepository implements IWeatherRepository {
  @override
  Future<Weather> getWeatherOfCity(String cityName) async {
    final result = await externalApi.currentWeatherByCityName(cityName);
    return Weather(cityName: cityName, celcius: result.temperature!.celsius!);
  }
}
