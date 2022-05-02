import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/notifiers/auth_notifier.dart';
import 'package:flutter_application_1/riverpod/src/providers/auth_providers.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/overview_view.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/settings_view.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/weather/weather_overview.dart';
import 'package:flutter_application_1/riverpod/src/views/home_dashboard_views/weather/weather_view.dart';
import 'package:flutter_application_1/riverpod/src/views/login.dart';
import 'package:flutter_application_1/riverpod/src/views/verification_view.dart';
import 'package:flutter_application_1/riverpod/src/widgets/logged_in_widgets.dart';
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
    refreshListenable: _notifier,
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
    navigatorBuilder: _navigatorBuilder,
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

  String? _redirect(GoRouterState goRouterState) {
    final currentRoute = goRouterState.location;
    final currentAuthState = _notifier.value;
    final isUnverifiedRoute = _isUnverifiedRoute(currentRoute);
    final isVerifiedRoute = _isVerifiedRoute(currentRoute);
    final isUnauthenticatedRoute = _isUnauthenticatedRoute(currentRoute);
    return currentAuthState.map<String?>(
      unknown: (_) => null,
      loggedOut: (_) {
        if (!isUnauthenticatedRoute) {
          return AppRouter.loginRoute;
        }
      },
      loggedIn: (loggedInState) {
        final isVerified = loggedInState.isVerified;

        if (isVerified) {
          if (!isVerifiedRoute) {
            return AppRouter.overviewRoute;
          }
        } else {
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
    final toMount = _AppLayoutBuilder(
      goRouterState: goRouterState,
      child: child!,
      appLayout: () {
        if (isAuthRoute) {
          if (isVerifiedRoute) {
            return _AppLayout.verified;
          } else {
            return _AppLayout.unverified;
          }
        } else {
          return _AppLayout.loggedOff;
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

enum _AppLayout { loggedOff, unverified, verified }

extension _AppLayoutExtension on _AppLayout {
  bool get isLoggedOff => this == _AppLayout.loggedOff;
  bool get isUnverified => this == _AppLayout.unverified;
  bool get isVerified => this == _AppLayout.verified;
}

class _AppLayoutBuilder extends ConsumerWidget {
  final Widget child;
  final _AppLayout appLayout;
  final GoRouterState goRouterState;

  const _AppLayoutBuilder({
    Key? key,
    required this.child,
    required this.appLayout,
    required this.goRouterState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<AuthState>(authNotifierProvider,
        (previous, next) => _listener(previous, next, context));
    switch (appLayout) {
      case _AppLayout.loggedOff:
        return child;
      case _AppLayout.unverified:
      case _AppLayout.verified:
        return LayoutBuilder(
          key: goRouterState.pageKey,
          builder: (_, constraints) {
            final bool showDesktopLayout = constraints.maxWidth >= 1028;
            final showNavigation = appLayout.isVerified;
            final currentRoute = goRouterState.location;
            return Overlay(
              key: goRouterState.pageKey,
              initialEntries: [
                OverlayEntry(
                  builder: (_) => Scaffold(
                    appBar: AppBar(
                      title: Text(currentRoute),
                      actions: [
                        if (showNavigation && showDesktopLayout) ...[
                          _AppBarNavItem.overview(currentRoute: currentRoute),
                          _AppBarNavItem.weather(currentRoute: currentRoute),
                          _AppBarNavItem.settings(currentRoute: currentRoute),
                        ],
                      ],
                    ),
                    body: child,
                    drawer: const LoggedInDrawer(),
                    bottomNavigationBar: showNavigation && !showDesktopLayout
                        ? const LoggedInBottomNavBar()
                        : null,
                  ),
                ),
              ],
            );
          },
        );
    }
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

class _AppBarNavItem extends StatelessWidget {
  final String label;
  final String routeToNavTo;
  final bool isSelected;
  const _AppBarNavItem({
    Key? key,
    required this.label,
    required this.routeToNavTo,
    required String currentRoute,
  })  : isSelected = currentRoute == routeToNavTo,
        super(key: key);
  const _AppBarNavItem.overview({
    Key? key,
    required String currentRoute,
  })  : label = 'Overview',
        routeToNavTo = AppRouter.overviewRoute,
        isSelected = AppRouter.overviewRoute == currentRoute,
        super(key: key);
  const _AppBarNavItem.weather({
    Key? key,
    required String currentRoute,
  })  : label = 'Weather',
        routeToNavTo = AppRouter.weatherOverviewRoute,
        isSelected = AppRouter.weatherOverviewRoute == currentRoute,
        super(key: key);
  const _AppBarNavItem.settings({
    Key? key,
    required String currentRoute,
  })  : label = 'Settings',
        routeToNavTo = AppRouter.settingsRoute,
        isSelected = AppRouter.settingsRoute == currentRoute,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: context.theme.isLightMode ? Colors.white : null),
      onPressed: isSelected ? null : () => context.go(routeToNavTo),
      child: Text(label),
    );
  }
}
