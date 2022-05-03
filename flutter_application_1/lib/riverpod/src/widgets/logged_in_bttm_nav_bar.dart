import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class LoggedInBottomNavBar extends StatelessWidget {
  final String currentRoute;
  const LoggedInBottomNavBar({Key? key, required this.currentRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = _routeToIndexAdapter(currentRoute);
    final goRouter = GoRouter.of(context);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        switch (value) {
          case 0:
            goRouter.push(AppRouter.overviewRoute);
            return;
          case 1:
            goRouter.push(AppRouter.weatherOverviewRoute);
            return;
          case 2:
            goRouter.push(AppRouter.settingsRoute);
            return;
          default:
            throw 'unimplemented route $value';
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  // TODO pcelis 5.3.22 need to improve solution

  /// takes a route, and converts it over to an index
  /// that is inteneded to be used with a [BotomNavigationBar]
  int _routeToIndexAdapter(String route) {
    if (route == AppRouter.overviewRoute) {
      return 0;
    }
    // TODO pcelis 5.3.22 use regex or something better
    /// if route is `/weather` or `/weather<STRING>`
    if (route.contains(AppRouter.weatherOverviewRoute)) {
      return 1;
    }
    if (route == AppRouter.settingsRoute) {
      return 2;
    }
    throw 'Bad nav number';
  }
}
