import 'package:flutter_application_1/riverpod/src/models/http_client.dart';
import 'package:flutter_application_1/riverpod/src/models/user_model.dart';
import 'package:flutter_application_1/riverpod/src/notifiers/auth_notifier.dart';
import 'package:flutter_application_1/riverpod/src/notifiers/user_notifier.dart';
import 'package:flutter_application_1/riverpod/src/providers/repo_providers.dart';
import 'package:riverpod/riverpod.dart';

/// provides the Applications auth state
final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
        (ref) => AuthStateNotifier.init(ref.read));

/// provides the application the ability to manipulate the
/// current user, while providing state on those operations
/// and their results
final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>(
  (ref) {
    final currentAuthState = ref.watch(authNotifierProvider);
    final currentUser = currentAuthState.extractUserModel();
    final userRepository = ref.read(userRepoProvider);
    return UserStateNotifier(
      initialData: currentUser,
      userRepository: userRepository,
    );
  },
);

/// offers the [HttpClient] for the application, that has the required
/// headers based on the current [AuthState]
final httpClientProvider = Provider<HttpClient>(
  (ref) {
    final authState = ref.watch(authNotifierProvider);
    return authState.map(
      unknown: (_) => HttpClient.unauthenticated(),
      loggedOut: (_) => HttpClient.unauthenticated(),
      loggedIn: (loggedInState) {
        final userId = loggedInState.userModel.userId;
        return HttpClient.authenticated(userId: userId);
      },
    );
  },
);

extension _AuthStateExtension on AuthState {
  /// will return the current UserModel.
  ///
  /// returns null when there is no [UserModel] to provide
  UserModel? get currentUserModel => map(
        unknown: (_) => null,
        loggedOut: (_) => null,
        loggedIn: (loggedInState) => loggedInState.userModel,
      );

  /// will return a [UserModel] no no what
  UserModel extractUserModel() => currentUserModel ?? UserModel.dummyValues();
}
