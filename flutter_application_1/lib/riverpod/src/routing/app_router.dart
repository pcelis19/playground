import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/notifiers/auth_notifier.dart';
import 'package:flutter_application_1/riverpod/src/providers/auth_providers.dart';
import 'package:flutter_application_1/riverpod/src/utils/extensions.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/overview_view.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/settings_view.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/weather/weather_overview.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/weather/weather_view.dart';
import 'package:flutter_application_1/riverpod/src/views/login.dart';
import 'package:flutter_application_1/riverpod/src/views/verification_view.dart';
import 'package:flutter_application_1/riverpod/src/widgets/logged_in_layout_builder.dart';
import 'package:flutter_application_1/riverpod/src/widgets/logged_in_bttm_nav_bar.dart';
import 'package:flutter_application_1/riverpod/src/widgets/logged_in_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static AppRouter? _instance;
  static const loginRoute = '/login';
  static const verificationRoute = '/verification';
  static const overviewRoute = '/overview';
  static const settingsRoute = '/settings';
  static const weatherOverviewRoute = '/weather';
  static const weatherNamed = 'weather';
  static const verifiedRoutes = [
    overviewRoute,
    settingsRoute,
    weatherOverviewRoute,
  ];
  static const unverifiedRoutes = [verificationRoute];
  static const List<String> authenticatedRoutes = [
    ...verifiedRoutes,
    ...unverifiedRoutes,
  ];
  static const unauthenticatedRoutes = [loginRoute];

  final Reader _reader;
  final ValueNotifier<AuthState> _notifier;
  final AuthStateNotifier _authNotifier;

  AppRouter._({
    required Reader reader,
    required ValueNotifier<AuthState> notifier,
    required AuthStateNotifier authNotifier,
  })  : _reader = reader,
        _notifier = notifier,
        _authNotifier = authNotifier;
  factory AppRouter.init(Reader reader) {
    if (_instance != null) {
      return _instance!;
    } else {
      final authNotifier = reader(authNotifierProvider.notifier);
      final notifier = ValueNotifier<AuthState>(authNotifier.state);
      authNotifier.addListener((state) {
        notifier.value = state;
      });
      _instance = AppRouter._(
          reader: reader, notifier: notifier, authNotifier: authNotifier);
      return _instance!;
    }
  }
  late final GoRouter _goRouter = GoRouter(
    /// notifies the Router that there an event
    /// has been triggered
    refreshListenable: _notifier,

    /// routes for the application
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (_, goRouterState) => const MaterialPage(
          child: Material(child: Center(child: Text('Welcome'))),
        ),
      ),
      GoRoute(
        path: loginRoute,
        pageBuilder: (_, goRouterState) => MaterialPage(
          key: goRouterState.pageKey,
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: verificationRoute,
        pageBuilder: (_, goRouterState) => MaterialPage(
          key: goRouterState.pageKey,
          child: const VerificationView(),
        ),
      ),
      GoRoute(
        path: overviewRoute,
        pageBuilder: (_, goRouterState) => MaterialPage(
          key: goRouterState.pageKey,
          child: const OverviewView(),
        ),
      ),
      GoRoute(
        path: settingsRoute,
        pageBuilder: (_, goRouterState) => MaterialPage(
          key: goRouterState.pageKey,
          child: const SettingsView(),
        ),
      ),
      GoRoute(
        path: weatherOverviewRoute,
        pageBuilder: (_, goRouterState) => MaterialPage(
          key: goRouterState.pageKey,
          child: const WeatherOverviewView(),
        ),
        routes: [
          /// uses params in the address bar to route to a city
          GoRoute(
            path: ':cityName',
            name: weatherNamed,
            pageBuilder: (_, goRouterState) {
              final cityName = goRouterState.params['cityName'];
              if (cityName == null) {
                return MaterialPage(
                    key: goRouterState.pageKey,
                    child: ErrorWidget('cityName is null'));
              }
              return MaterialPage(
                key: goRouterState.pageKey,
                child: WeatherView(cityName: cityName),
              );
            },
          )
        ],
      )
    ],

    /// can build a frame around the current view
    navigatorBuilder: _navigatorBuilder,

    /// will redirect when user is not in the correct
    /// route, and needs to be rerouted
    /// triggered when an attempt to navigation is made
    /// or refreshListenable registers an event
    redirect: _redirect,
    debugLogDiagnostics: true,
  );

  /// will throw if `init` has not been called yet
  static AppRouter get instance => _instance!;

  /// will throw if `init` has not been called yet
  static GoRouter get goRouterInstance => instance._goRouter;

  GoRouter get goRouter => _goRouter;

  /// whether route is considered an authenticated route
  bool _isAuthenticatedRoute(String route) =>
      authenticatedRoutes.containsRoute(route);

  /// whether route is considered an unauthenticated route
  bool _isUnauthenticatedRoute(String route) =>
      unauthenticatedRoutes.containsRoute(route);

  ///
  bool _isVerifiedRoute(String route) => verifiedRoutes.containsRoute(route);

  ///
  bool _isUnverifiedRoute(String route) =>
      unverifiedRoutes.containsRoute(route);

  /// when we return a String, the user will be
  /// rerouted to that url
  /// * note when returns String, this will be called
  /// again since navigation is being requested
  String? _redirect(GoRouterState goRouterState) {
    final currentRoute = goRouterState.location;
    final currentAuthState = _notifier.value;
    final isUnverifiedRoute = _isUnverifiedRoute(currentRoute);
    final isVerifiedRoute = _isVerifiedRoute(currentRoute);
    final isAuthenticatedRoute = isUnverifiedRoute || isVerifiedRoute;
    return currentAuthState.map<String?>(
      unknown: (_) => null,
      loggedOut: (_) {
        // if logged out, but in an authenticated route
        // reroute them to the Login Screen
        if (isAuthenticatedRoute) {
          return AppRouter.loginRoute;
        }
      },
      loggedIn: (loggedInState) {
        final isVerified = loggedInState.isVerified;

        if (isVerified) {
          // if verified, but not in a verified route
          // then reroute them to the overview screen
          if (!isVerifiedRoute) {
            return AppRouter.overviewRoute;
          }
        } else {
          // if not verified and not in verification screen,
          // then reroute then to verification screen
          if (!isUnverifiedRoute) {
            return AppRouter.verificationRoute;
          }
        }
      },
    );
  }

  Widget _navigatorBuilder(
      BuildContext context, GoRouterState goRouterState, Widget? child) {
    final authState = _notifier.value;
    if (authState.isUnknownState) {
      return Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Contacting Servers, Please Wait'),
            SizedBox(
              height: 8,
            ),
            Center(child: CircularProgressIndicator())
          ],
        ),
      );
    }

    final currentRoute = goRouterState.location;
    final isAuthRoute = _isAuthenticatedRoute(currentRoute);
    final isVerifiedRoute = _isVerifiedRoute(currentRoute);
    final toMount = AppOverlayBuilder(
      goRouterState: goRouterState,
      child: child!,
      appOverlayType: () {
        if (isAuthRoute) {
          if (isVerifiedRoute) {
            return AppOverlayType.verified;
          } else {
            return AppOverlayType.unverified;
          }
        } else {
          return AppOverlayType.loggedOff;
        }
      }(),
    );
    return Column(
      children: [
        Expanded(child: toMount),
        const Divider(height: 1),
        SizedBox(
          height: kToolbarHeight,
          child: Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(child: Text(currentRoute)),
                ),
                Expanded(
                  child:
                      SingleChildScrollView(child: Text(authState.toString())),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

extension _ListExtension on List<String> {
  bool containsRoute(String route) =>
      indexWhere((element) => route.startsWith(element)) > -1;
}

enum AppOverlayType { loggedOff, unverified, verified }

extension AppLayoutExtension on AppOverlayType {
  bool get isLoggedOff => this == AppOverlayType.loggedOff;
  bool get isUnverified => this == AppOverlayType.unverified;
  bool get isVerified => this == AppOverlayType.verified;
}

class AppOverlayBuilder extends StatelessWidget {
  final Widget child;
  final AppOverlayType appOverlayType;
  final GoRouterState goRouterState;

  const AppOverlayBuilder({
    Key? key,
    required this.child,
    required this.appOverlayType,
    required this.goRouterState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // based on limitation of GoRouter need to
    // wrap app in Navigator
    return Navigator(
      key: goRouterState.pageKey,
      onPopPage: (_, __) => false,
      pages: [
        MaterialPage(
          key: goRouterState.pageKey,
          child: () {
            return Consumer(
              builder: (context, ref, child) {
                ref.listen<AuthState>(
                  authNotifierProvider,
                  (previous, next) => _listener(previous, next, context),
                );
                return child!;
              },
              child: () {
                switch (appOverlayType) {
                  case AppOverlayType.loggedOff:
                    return child;
                  case AppOverlayType.unverified:
                  case AppOverlayType.verified:
                    return LoggedInLayoutBuilder(
                      goRouterState: goRouterState,
                      appOverlayType: appOverlayType,
                      child: child,
                    );
                }
              }(),
            );
          }(),
        ),
      ],
    );
  }

  void _listener(AuthState? previous, AuthState? next, BuildContext context) {
    if (previous != next && next?.failure != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('An erorr Occured'),
            content: const Text('Sorry about that'),
            actions: [
              ElevatedButton(
                  onPressed: Navigator.of(context).pop, child: const Text('OK'))
            ],
          );
        },
      );
    }
  }
}
