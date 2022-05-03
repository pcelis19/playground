import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/routing/app_router.dart';
import 'package:flutter_application_1/riverpod/src/utils/extensions.dart';
import 'package:flutter_application_1/riverpod/src/widgets/buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      columnMainAxisAlignment: MainAxisAlignment.center,
      rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
      layout: context.responsiveWrapper.isSmallerThan(DESKTOP)
          ? ResponsiveRowColumnType.ROW
          : ResponsiveRowColumnType.COLUMN,
      children: const [
        ResponsiveRowColumnItem(child: _OverviewNavButton.settings()),
        ResponsiveRowColumnItem(child: _OverviewNavButton.weather()),
      ],
    );
  }
}

class _OverviewNavButton extends StatelessWidget {
  final String label;
  final String routeToNavTo;
  final IconData iconData;
  const _OverviewNavButton({
    Key? key,
    required this.label,
    required this.routeToNavTo,
    required this.iconData,
  }) : super(key: key);
  const _OverviewNavButton.settings({Key? key})
      : label = 'Settings',
        routeToNavTo = AppRouter.settingsRoute,
        iconData = Icons.settings,
        super(key: key);
  const _OverviewNavButton.weather({Key? key})
      : label = 'Weather',
        routeToNavTo = AppRouter.weatherOverviewRoute,
        iconData = Icons.cloud,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OversizeIconButton(
      onPressed: () => context.go(routeToNavTo),
      icon: Icon(iconData, size: 48),
      label: label,
    );
  }
}
