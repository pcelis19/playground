import 'package:flutter_application_1/riverpod/src/mock_utils/mock_utils.dart';
import 'package:flutter_application_1/riverpod/src/models/failure.dart';
import 'package:flutter_application_1/riverpod/src/models/user_model.dart';
import 'package:flutter_application_1/riverpod/src/models/data_request.dart';
import 'package:flutter_application_1/riverpod/src/repositories/repository_interface.dart';
import 'package:riverpod/riverpod.dart';

class MockUserRepository implements IUserRepository {
  final Reader _reader;

  const MockUserRepository(this._reader);
  @override
  Future<DataRequest<UserModel>> getById(String id) async {
    try {
      await mockDelay(_reader, throws: true);
      return DataRequest.success(UserModel.dummyValues());
    } catch (e) {
      return DataRequest.failure(Failure.fromObject(e));
    }
  }

  @override
  Future<DataRequest<UserModel>> getCurrent() async {
    try {
      await mockDelay(_reader, throws: true);
      return DataRequest.success(UserModel.dummyValues());
    } catch (e) {
      return DataRequest.failure(Failure.fromObject(e));
    }
  }

  @override
  Future<Request> updateLastName(String lastName) async {
    try {
      await mockDelay(_reader, throws: true);
      return const Request.success();
    } catch (e) {
      return Request.failure(Failure.fromObject(e));
    }
  }
}
