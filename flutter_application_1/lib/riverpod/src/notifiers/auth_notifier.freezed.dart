// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _Unknown unknown({bool isLoading = false, Failure? failure = null}) {
    return _Unknown(
      isLoading: isLoading,
      failure: failure,
    );
  }

  _LoggedOut loggedOut({bool isLoading = false, Failure? failure = null}) {
    return _LoggedOut(
      isLoading: isLoading,
      failure: failure,
    );
  }

  _LoggedIn loggedIn(
      {required UserModel userModel,
      bool isLoading = false,
      Failure? failure = null}) {
    return _LoggedIn(
      userModel: userModel,
      isLoading: isLoading,
      failure: failure,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, Failure? failure) unknown,
    required TResult Function(bool isLoading, Failure? failure) loggedOut,
    required TResult Function(
            UserModel userModel, bool isLoading, Failure? failure)
        loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_LoggedIn value) loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, Failure? failure});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, Failure? failure});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(_Unknown _value, $Res Function(_Unknown) _then)
      : super(_value, (v) => _then(v as _Unknown));

  @override
  _Unknown get _value => super._value as _Unknown;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failure = freezed,
  }) {
    return _then(_Unknown(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_Unknown extends _Unknown {
  const _$_Unknown({this.isLoading = false, this.failure = null}) : super._();

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AuthState.unknown(isLoading: $isLoading, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unknown &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$UnknownCopyWith<_Unknown> get copyWith =>
      __$UnknownCopyWithImpl<_Unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, Failure? failure) unknown,
    required TResult Function(bool isLoading, Failure? failure) loggedOut,
    required TResult Function(
            UserModel userModel, bool isLoading, Failure? failure)
        loggedIn,
  }) {
    return unknown(isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
  }) {
    return unknown?.call(isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(isLoading, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_LoggedIn value) loggedIn,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown extends AuthState {
  const factory _Unknown({bool isLoading, Failure? failure}) = _$_Unknown;
  const _Unknown._() : super._();

  @override
  bool get isLoading;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoggedOutCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LoggedOutCopyWith(
          _LoggedOut value, $Res Function(_LoggedOut) then) =
      __$LoggedOutCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, Failure? failure});
}

/// @nodoc
class __$LoggedOutCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoggedOutCopyWith<$Res> {
  __$LoggedOutCopyWithImpl(_LoggedOut _value, $Res Function(_LoggedOut) _then)
      : super(_value, (v) => _then(v as _LoggedOut));

  @override
  _LoggedOut get _value => super._value as _LoggedOut;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failure = freezed,
  }) {
    return _then(_LoggedOut(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_LoggedOut extends _LoggedOut {
  const _$_LoggedOut({this.isLoading = false, this.failure = null}) : super._();

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AuthState.loggedOut(isLoading: $isLoading, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoggedOut &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$LoggedOutCopyWith<_LoggedOut> get copyWith =>
      __$LoggedOutCopyWithImpl<_LoggedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, Failure? failure) unknown,
    required TResult Function(bool isLoading, Failure? failure) loggedOut,
    required TResult Function(
            UserModel userModel, bool isLoading, Failure? failure)
        loggedIn,
  }) {
    return loggedOut(isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
  }) {
    return loggedOut?.call(isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(isLoading, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_LoggedIn value) loggedIn,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut extends AuthState {
  const factory _LoggedOut({bool isLoading, Failure? failure}) = _$_LoggedOut;
  const _LoggedOut._() : super._();

  @override
  bool get isLoading;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$LoggedOutCopyWith<_LoggedOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoggedInCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LoggedInCopyWith(_LoggedIn value, $Res Function(_LoggedIn) then) =
      __$LoggedInCopyWithImpl<$Res>;
  @override
  $Res call({UserModel userModel, bool isLoading, Failure? failure});

  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$LoggedInCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoggedInCopyWith<$Res> {
  __$LoggedInCopyWithImpl(_LoggedIn _value, $Res Function(_LoggedIn) _then)
      : super(_value, (v) => _then(v as _LoggedIn));

  @override
  _LoggedIn get _value => super._value as _LoggedIn;

  @override
  $Res call({
    Object? userModel = freezed,
    Object? isLoading = freezed,
    Object? failure = freezed,
  }) {
    return _then(_LoggedIn(
      userModel: userModel == freezed
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
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

class _$_LoggedIn extends _LoggedIn {
  const _$_LoggedIn(
      {required this.userModel, this.isLoading = false, this.failure = null})
      : super._();

  @override
  final UserModel userModel;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AuthState.loggedIn(userModel: $userModel, isLoading: $isLoading, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoggedIn &&
            const DeepCollectionEquality().equals(other.userModel, userModel) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userModel),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$LoggedInCopyWith<_LoggedIn> get copyWith =>
      __$LoggedInCopyWithImpl<_LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, Failure? failure) unknown,
    required TResult Function(bool isLoading, Failure? failure) loggedOut,
    required TResult Function(
            UserModel userModel, bool isLoading, Failure? failure)
        loggedIn,
  }) {
    return loggedIn(userModel, isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
  }) {
    return loggedIn?.call(userModel, isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, Failure? failure)? unknown,
    TResult Function(bool isLoading, Failure? failure)? loggedOut,
    TResult Function(UserModel userModel, bool isLoading, Failure? failure)?
        loggedIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(userModel, isLoading, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_LoggedIn value) loggedIn,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedIn extends AuthState {
  const factory _LoggedIn(
      {required UserModel userModel,
      bool isLoading,
      Failure? failure}) = _$_LoggedIn;
  const _LoggedIn._() : super._();

  UserModel get userModel;
  @override
  bool get isLoading;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$LoggedInCopyWith<_LoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}
