import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/routing/app_router.dart';
import 'package:flutter_application_1/riverpod/src/utils/extensions.dart';
import 'package:flutter_application_1/riverpod/src/widgets/logged_in_bttm_nav_bar.dart';
import 'package:flutter_application_1/riverpod/src/widgets/logged_in_drawer.dart';
import 'package:go_router/go_router.dart';

class LoggedInLayoutBuilder extends StatelessWidget {
  final GoRouterState goRouterState;
  final AppOverlayType appOverlayType;
  final Widget child;
  const LoggedInLayoutBuilder({
    Key? key,
    required this.goRouterState,
    required this.appOverlayType,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: goRouterState.pageKey,
      builder: (_, constraints) {
        final bool showDesktopLayout = constraints.maxWidth >= 1028;
        final showNavigation = appOverlayType.isVerified;
        final currentRoute = goRouterState.location;
        return Scaffold(
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
              ? LoggedInBottomNavBar(currentRoute: currentRoute)
              : null,
        );
      },
    );
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
