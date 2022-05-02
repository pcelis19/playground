import 'dart:developer';
import 'dart:ui';

import 'package:flutter_application_1/riverpod/src/mock_utils/mock_utils.dart';
import 'package:flutter_application_1/riverpod/src/models/failure.dart';
import 'package:flutter_application_1/riverpod/src/models/user_model.dart';
import 'package:flutter_application_1/riverpod/src/providers/repo_providers.dart';
import 'package:flutter_application_1/riverpod/src/repositories/repository_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.unknown({
    @Default(false) bool isLoading,
    @Default(null) Failure? failure,
  }) = _Unknown;
  const factory AuthState.loggedOut({
    @Default(false) bool isLoading,
    @Default(null) Failure? failure,
  }) = _LoggedOut;

  const factory AuthState.loggedIn({
    required UserModel userModel,
    @Default(false) bool isLoading,
    @Default(null) Failure? failure,
  }) = _LoggedIn;

  bool get isUnknownState =>
      maybeMap(unknown: (_) => true, orElse: () => false);

  bool get isVerified => maybeMap(
      loggedIn: (loggedInState) => loggedInState.userModel.isVerified,
      orElse: () => false);
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  static AuthStateNotifier? _instance;
  final Reader _reader;

  IAuthRepository get _authRepo => _reader(authRepoProvider);
  IUserRepository get _userRepo => _reader(userRepoProvider);

  /// if already initialized then will return that Singleton
  /// instance
  factory AuthStateNotifier.init(Reader reader) {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AuthStateNotifier._(reader);
      return _instance!;
    }
  }

  /// private constuctor, so that instance can only be retreived by
  /// `instance` or by `init`
  AuthStateNotifier._(this._reader) : super(const AuthState.unknown()) {
    _init();
  }

  Future<void> _init() async {
    await mockDelay(_reader);
    state = state.copyWith(isLoading: true);
    try {
      final dataRequestResult = await _authRepo.getCurrentUser();
      dataRequestResult.when(
        success: (userModel) {
          if (userModel == null) {
            state = const AuthState.loggedOut();
          } else {
            state = AuthState.loggedIn(userModel: userModel);
          }
        },
        failure: (failure) {
          state = AuthState.loggedOut(failure: failure);
        },
      );
    } catch (error) {
      state = AuthState.loggedOut(failure: Failure.fromObject(error));
    }
  }

  /// must run `init` first, otherwise this function
  /// will throw a null exception
  static AuthStateNotifier get instance => _instance!;

  Future<void> logIn() async {
    if (state.failure != null) {
      state = AuthState.loggedIn(userModel: UserModel.dummyValues());
      return;
    }

    state = state.copyWith(isLoading: true, failure: null);
    try {
      await mockDelay(_reader, throws: true);
      state = AuthState.loggedIn(
          userModel: UserModel.dummyValues(random.nextBool()));
    } on Exception catch (error) {
      state = AuthState.loggedOut(failure: Failure.fromObject(error));
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);
    await mockDelay(_reader);
    state = const AuthState.loggedOut();
  }

  Future<void> verify() async {
    state.maybeMap(loggedIn: (loggedInState) {
      state = loggedInState.copyWith(
          userModel: loggedInState.userModel.copyWith(isVerified: true));
    }, orElse: () {
      log('Current state: $state');
      throw 'Cannot verify if not logged in';
    });
  }
}
