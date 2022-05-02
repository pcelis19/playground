import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const Weather._();
  const factory Weather({
    required String cityName,
    required double celcius,
  }) = _Weather;

  String get celciusToString => celcius.toStringAsPrecision(2);
}
