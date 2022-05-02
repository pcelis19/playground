// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _Loading loading(UserModel userModel) {
    return _Loading(
      userModel,
    );
  }

  _Data data(UserModel userModel) {
    return _Data(
      userModel,
    );
  }

  _Error error(UserModel userModel, Failure failure) {
    return _Error(
      userModel,
      failure,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  UserModel get userModel => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) loading,
    required TResult Function(UserModel userModel) data,
    required TResult Function(UserModel userModel, Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call({UserModel userModel});

  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? userModel = freezed,
  }) {
    return _then(_value.copyWith(
      userModel: userModel == freezed
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get userModel {
    return $UserModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value));
    });
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({UserModel userModel});

  @override
  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? userModel = freezed,
  }) {
    return _then(_Loading(
      userModel == freezed
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.userModel);

  @override
  final UserModel userModel;

  @override
  String toString() {
    return 'UserState.loading(userModel: $userModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.userModel, userModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userModel));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) loading,
    required TResult Function(UserModel userModel) data,
    required TResult Function(UserModel userModel, Failure failure) error,
  }) {
    return loading(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
  }) {
    return loading?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading(UserModel userModel) = _$_Loading;

  @override
  UserModel get userModel;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DataCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call({UserModel userModel});

  @override
  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object? userModel = freezed,
  }) {
    return _then(_Data(
      userModel == freezed
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data(this.userModel);

  @override
  final UserModel userModel;

  @override
  String toString() {
    return 'UserState.data(userModel: $userModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            const DeepCollectionEquality().equals(other.userModel, userModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userModel));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) loading,
    required TResult Function(UserModel userModel) data,
    required TResult Function(UserModel userModel, Failure failure) error,
  }) {
    return data(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
  }) {
    return data?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements UserState {
  const factory _Data(UserModel userModel) = _$_Data;

  @override
  UserModel get userModel;
  @override
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({UserModel userModel, Failure failure});

  @override
  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? userModel = freezed,
    Object? failure = freezed,
  }) {
    return _then(_Error(
      userModel == freezed
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.userModel, this.failure);

  @override
  final UserModel userModel;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'UserState.error(userModel: $userModel, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.userModel, userModel) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userModel),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) loading,
    required TResult Function(UserModel userModel) data,
    required TResult Function(UserModel userModel, Failure failure) error,
  }) {
    return error(userModel, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
  }) {
    return error?.call(userModel, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? loading,
    TResult Function(UserModel userModel)? data,
    TResult Function(UserModel userModel, Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(userModel, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserState {
  const factory _Error(UserModel userModel, Failure failure) = _$_Error;

  @override
  UserModel get userModel;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
