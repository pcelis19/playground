import 'package:flutter_application_1/riverpod/src/models/data_request.dart';
import 'package:flutter_application_1/riverpod/src/models/user_model.dart';
import 'package:flutter_application_1/riverpod/src/models/weather.dart';

abstract class IUserRepository {
  Future<DataRequest<UserModel>> getCurrent();
  Future<DataRequest<UserModel>> getById(String id);
  Future<Request> updateLastName(String lastName);
}

abstract class IAuthRepository {
  Future<DataRequest<UserModel>> signIn({
    required String email,
    required String password,
  });

  Future<Request> signOut();

  /// will get the current user in the system, if none
  /// is found then will return null
  Future<DataRequest<UserModel?>> getCurrentUser();
}

abstract class IWeatherRepository {
  Future<Weather> getWeatherOfCity(String cityName);
}
