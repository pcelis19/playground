import 'package:flutter_application_1/riverpod/src/mock_utils/mock_utils.dart';
import 'package:flutter_application_1/riverpod/src/models/failure.dart';
import 'package:flutter_application_1/riverpod/src/models/user_model.dart';
import 'package:flutter_application_1/riverpod/src/models/data_request.dart';
import 'package:flutter_application_1/riverpod/src/repositories/repository_interface.dart';
import 'package:riverpod/riverpod.dart';

class MockAuthRepository implements IAuthRepository {
  final Reader _reader;

  const MockAuthRepository(this._reader);
  @override
  Future<DataRequest<UserModel?>> getCurrentUser() async {
    try {
      await mockDelay(_reader, throws: true);
      return DataRequest.success(UserModel.dummyValues());
    } catch (e) {
      return DataRequest.failure(Failure.fromObject(e));
    }
  }

  @override
  Future<DataRequest<UserModel>> signIn(
      {required String email, required String password}) async {
    try {
      await mockDelay(_reader, throws: true);
      return DataRequest.success(UserModel.dummyValues());
    } catch (e) {
      return DataRequest.failure(Failure.fromObject(e));
    }
  }

  @override
  Future<Request> signOut() async {
    try {
      await mockDelay(_reader, throws: true);
      return const Request.success();
    } catch (e) {
      return Request.failure(Failure.fromObject(e));
    }
    ;
  }
}
