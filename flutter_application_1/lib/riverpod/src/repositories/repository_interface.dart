import 'package:flutter_application_1/riverpod/src/models/data_request.dart';
import 'package:flutter_application_1/riverpod/src/models/user_model.dart';
import 'package:flutter_application_1/riverpod/src/models/weather.dart';

abstract class IUserRepository {
  /// will attempt to retreive the current user of the application
  ///
  /// * return a [DataRequest.success] when able to retreive user
  /// * returns a [DataRequest.failure] when unable to retreive user
  Future<DataRequest<UserModel>> getCurrent();

  /// will attempt to retreive a [UserModel] by their `id`
  ///
  /// * return a [DataRequest.success] when able to retreive user
  /// * returns a [DataRequest.failure] when unable to retreive user
  Future<DataRequest<UserModel>> getById(String id);

  /// will update the last name of the current user of the application
  ///
  /// * return a [Request.success] wehn able to make update
  ///     * recommended to fetch [UserModel] with `getCurrent()`
  ///       to sink again with backend
  /// * returns a [Request.failure] when unable to make update
  Future<Request> updateLastName(String lastName);
}

abstract class IAuthRepository {
  /// Given an email and password, will attempt to sign in the user
  ///
  /// * returns [DataRequest.success] with a [UserModel] when the
  /// user can sign in
  /// * return [DataRequest.failure] when unable to sign user in
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
  // TODO pcelis 5.4.22 move over to use [DataRequest] currently
  // built this way to showcase [FutureProvider]
  /// given a `cityName` this will attempt to retrieve the
  /// [Weather] for that city
  Future<Weather> getWeatherOfCity(String cityName);
}
