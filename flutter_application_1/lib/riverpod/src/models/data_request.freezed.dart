// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DataRequestTearOff {
  const _$DataRequestTearOff();

  DataRequestSuccessful<T> success<T>(T data) {
    return DataRequestSuccessful<T>(
      data,
    );
  }

  DataRequestFailure<T> failure<T>(Failure failure) {
    return DataRequestFailure<T>(
      failure,
    );
  }
}

/// @nodoc
const $DataRequest = _$DataRequestTearOff();

/// @nodoc
mixin _$DataRequest<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataRequestSuccessful<T> value) success,
    required TResult Function(DataRequestFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataRequestSuccessful<T> value)? success,
    TResult Function(DataRequestFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataRequestSuccessful<T> value)? success,
    TResult Function(DataRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataRequestCopyWith<T, $Res> {
  factory $DataRequestCopyWith(
          DataRequest<T> value, $Res Function(DataRequest<T>) then) =
      _$DataRequestCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$DataRequestCopyWithImpl<T, $Res>
    implements $DataRequestCopyWith<T, $Res> {
  _$DataRequestCopyWithImpl(this._value, this._then);

  final DataRequest<T> _value;
  // ignore: unused_field
  final $Res Function(DataRequest<T>) _then;
}

/// @nodoc
abstract class $DataRequestSuccessfulCopyWith<T, $Res> {
  factory $DataRequestSuccessfulCopyWith(DataRequestSuccessful<T> value,
          $Res Function(DataRequestSuccessful<T>) then) =
      _$DataRequestSuccessfulCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$DataRequestSuccessfulCopyWithImpl<T, $Res>
    extends _$DataRequestCopyWithImpl<T, $Res>
    implements $DataRequestSuccessfulCopyWith<T, $Res> {
  _$DataRequestSuccessfulCopyWithImpl(DataRequestSuccessful<T> _value,
      $Res Function(DataRequestSuccessful<T>) _then)
      : super(_value, (v) => _then(v as DataRequestSuccessful<T>));

  @override
  DataRequestSuccessful<T> get _value =>
      super._value as DataRequestSuccessful<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(DataRequestSuccessful<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DataRequestSuccessful<T> implements DataRequestSuccessful<T> {
  const _$DataRequestSuccessful(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DataRequest<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataRequestSuccessful<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $DataRequestSuccessfulCopyWith<T, DataRequestSuccessful<T>> get copyWith =>
      _$DataRequestSuccessfulCopyWithImpl<T, DataRequestSuccessful<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Failure failure) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Failure failure)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataRequestSuccessful<T> value) success,
    required TResult Function(DataRequestFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataRequestSuccessful<T> value)? success,
    TResult Function(DataRequestFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataRequestSuccessful<T> value)? success,
    TResult Function(DataRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DataRequestSuccessful<T> implements DataRequest<T> {
  const factory DataRequestSuccessful(T data) = _$DataRequestSuccessful<T>;

  T get data;
  @JsonKey(ignore: true)
  $DataRequestSuccessfulCopyWith<T, DataRequestSuccessful<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataRequestFailureCopyWith<T, $Res> {
  factory $DataRequestFailureCopyWith(DataRequestFailure<T> value,
          $Res Function(DataRequestFailure<T>) then) =
      _$DataRequestFailureCopyWithImpl<T, $Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$DataRequestFailureCopyWithImpl<T, $Res>
    extends _$DataRequestCopyWithImpl<T, $Res>
    implements $DataRequestFailureCopyWith<T, $Res> {
  _$DataRequestFailureCopyWithImpl(
      DataRequestFailure<T> _value, $Res Function(DataRequestFailure<T>) _then)
      : super(_value, (v) => _then(v as DataRequestFailure<T>));

  @override
  DataRequestFailure<T> get _value => super._value as DataRequestFailure<T>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(DataRequestFailure<T>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$DataRequestFailure<T> implements DataRequestFailure<T> {
  const _$DataRequestFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'DataRequest<$T>.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataRequestFailure<T> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $DataRequestFailureCopyWith<T, DataRequestFailure<T>> get copyWith =>
      _$DataRequestFailureCopyWithImpl<T, DataRequestFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataRequestSuccessful<T> value) success,
    required TResult Function(DataRequestFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataRequestSuccessful<T> value)? success,
    TResult Function(DataRequestFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataRequestSuccessful<T> value)? success,
    TResult Function(DataRequestFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class DataRequestFailure<T> implements DataRequest<T> {
  const factory DataRequestFailure(Failure failure) = _$DataRequestFailure<T>;

  Failure get failure;
  @JsonKey(ignore: true)
  $DataRequestFailureCopyWith<T, DataRequestFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RequestTearOff {
  const _$RequestTearOff();

  RequestSuccessful success() {
    return const RequestSuccessful();
  }

  RequestFailure failure(Failure failure) {
    return RequestFailure(
      failure,
    );
  }
}

/// @nodoc
const $Request = _$RequestTearOff();

/// @nodoc
mixin _$Request {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestSuccessful value) success,
    required TResult Function(RequestFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestSuccessful value)? success,
    TResult Function(RequestFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestSuccessful value)? success,
    TResult Function(RequestFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestCopyWithImpl<$Res> implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  final Request _value;
  // ignore: unused_field
  final $Res Function(Request) _then;
}

/// @nodoc
abstract class $RequestSuccessfulCopyWith<$Res> {
  factory $RequestSuccessfulCopyWith(
          RequestSuccessful value, $Res Function(RequestSuccessful) then) =
      _$RequestSuccessfulCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestSuccessfulCopyWithImpl<$Res> extends _$RequestCopyWithImpl<$Res>
    implements $RequestSuccessfulCopyWith<$Res> {
  _$RequestSuccessfulCopyWithImpl(
      RequestSuccessful _value, $Res Function(RequestSuccessful) _then)
      : super(_value, (v) => _then(v as RequestSuccessful));

  @override
  RequestSuccessful get _value => super._value as RequestSuccessful;
}

/// @nodoc

class _$RequestSuccessful implements RequestSuccessful {
  const _$RequestSuccessful();

  @override
  String toString() {
    return 'Request.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestSuccessful);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(Failure failure) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(Failure failure)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestSuccessful value) success,
    required TResult Function(RequestFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestSuccessful value)? success,
    TResult Function(RequestFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestSuccessful value)? success,
    TResult Function(RequestFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RequestSuccessful implements Request {
  const factory RequestSuccessful() = _$RequestSuccessful;
}

/// @nodoc
abstract class $RequestFailureCopyWith<$Res> {
  factory $RequestFailureCopyWith(
          RequestFailure value, $Res Function(RequestFailure) then) =
      _$RequestFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$RequestFailureCopyWithImpl<$Res> extends _$RequestCopyWithImpl<$Res>
    implements $RequestFailureCopyWith<$Res> {
  _$RequestFailureCopyWithImpl(
      RequestFailure _value, $Res Function(RequestFailure) _then)
      : super(_value, (v) => _then(v as RequestFailure));

  @override
  RequestFailure get _value => super._value as RequestFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(RequestFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$RequestFailure implements RequestFailure {
  const _$RequestFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'Request.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $RequestFailureCopyWith<RequestFailure> get copyWith =>
      _$RequestFailureCopyWithImpl<RequestFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(Failure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(Failure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestSuccessful value) success,
    required TResult Function(RequestFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestSuccessful value)? success,
    TResult Function(RequestFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestSuccessful value)? success,
    TResult Function(RequestFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class RequestFailure implements Request {
  const factory RequestFailure(Failure failure) = _$RequestFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  $RequestFailureCopyWith<RequestFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
