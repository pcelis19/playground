import 'package:flutter_application_1/riverpod/src/models/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_request.freezed.dart';

@freezed
class DataRequest<T> with _$DataRequest<T> {
  const factory DataRequest.success(T data) = DataRequestSuccessful;
  const factory DataRequest.failure(Failure failure) = DataRequestFailure;
}

@freezed
class Request with _$Request {
  const factory Request.success() = RequestSuccessful;
  const factory Request.failure(Failure failure) = RequestFailure;
}
