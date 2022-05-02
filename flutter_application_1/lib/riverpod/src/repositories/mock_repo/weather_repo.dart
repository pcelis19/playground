import 'package:flutter_application_1/riverpod/src/mock_utils/mock_utils.dart';
import 'package:flutter_application_1/riverpod/src/models/weather.dart';
import 'package:flutter_application_1/riverpod/src/providers/app_providers.dart';
import 'package:flutter_application_1/riverpod/src/repositories/repository_interface.dart';
import 'package:riverpod/riverpod.dart';

class MockWeatherRepository implements IWeatherRepository {
  final Reader _reader;

  MockWeatherRepository(this._reader);

  int get _failRate => (_reader(failRateStateProvider) * 100).truncate();

  @override
  Future<Weather> getWeatherOfCity(String cityName) async {
    await mockDelay(_reader);
    int didSucceed = random.nextInt(100);
    if (didSucceed > _failRate) {
      return Weather(cityName: cityName, celcius: random.nextDouble() * 100);
    } else {
      throw 'Mock error';
    }
  }
}
