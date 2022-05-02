import 'package:flutter_application_1/riverpod/src/models/failure.dart';
import 'package:flutter_application_1/riverpod/src/models/user_model.dart';
import 'package:flutter_application_1/riverpod/src/repositories/repository_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
part 'user_notifier.freezed.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  final IUserRepository _userRepository;

  UserStateNotifier({
    required UserModel initialData,
    required IUserRepository userRepository,
  })  : _userRepository = userRepository,
        super(UserState.data(initialData));

  /// resyncs the current user with latest result in the backend
  Future<void> resync() async {
    state = UserState.loading(state.userModel);
    try {
      final dataRequestResult = await _userRepository.getCurrent();
      dataRequestResult.when(
        success: (data) {
          state = UserState.data(data);
        },
        failure: (failure) {
          state = UserState.error(state.userModel, failure);
        },
      );
    } catch (error) {
      state = UserState.error(state.userModel, Failure.fromObject(error));
    }
  }

  /// will attempt to update the last name in the backend, then resyncs
  /// with the backend when the request is finished.
  Future<void> updateLastName(String lastName) async {
    state = UserState.loading(state.userModel);
    try {
      final requestResult = await _userRepository.updateLastName(lastName);
      await requestResult.when(
        success: () async {
          await resync();
        },
        failure: (failure) {
          state = UserState.error(state.userModel, failure);
        },
      );
    } catch (error) {
      state = UserState.error(state.userModel, Failure.fromObject(error));
    }
  }
}

@freezed
class UserState with _$UserState {
  const factory UserState.loading(UserModel userModel) = _Loading;
  const factory UserState.data(UserModel userModel) = _Data;
  const factory UserState.error(UserModel userModel, Failure failure) = _Error;
}
