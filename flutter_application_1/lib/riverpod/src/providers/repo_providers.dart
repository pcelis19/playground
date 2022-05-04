import 'package:flutter_application_1/riverpod/src/providers/app_providers.dart';
import 'package:flutter_application_1/riverpod/src/repositories/mock_repo/auth_repo.dart';
import 'package:flutter_application_1/riverpod/src/repositories/mock_repo/user_repo.dart';
import 'package:flutter_application_1/riverpod/src/repositories/mock_repo/weather_repo.dart';
import 'package:flutter_application_1/riverpod/src/repositories/using_external/weather_repo.dart';
import 'package:flutter_application_1/riverpod/src/repositories/repository_interface.dart';
import 'package:riverpod/riverpod.dart';

/// The authentication repo
final authRepoProvider =
    Provider<IAuthRepository>((ref) => MockAuthRepository(ref.read));

/// The user repository
final userRepoProvider =
    Provider<IUserRepository>((ref) => MockUserRepository(ref.read));

/// The weather repo
final weatherRepoProvider = Provider<IWeatherRepository>(
  (ref) {
    final fetchFromLive = ref.watch(fetchFromLiveDataStateProvider);
    if (fetchFromLive) {
      return WeatherRepository();
    } else {
      return MockWeatherRepository(ref.read);
    }
  },
);
