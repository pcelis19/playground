import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/mock_utils/mock_utils.dart';
import 'package:flutter_application_1/riverpod/src/providers/app_providers.dart';
import 'package:flutter_application_1/riverpod/src/providers/auth_providers.dart';
import 'package:flutter_application_1/riverpod/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// TODO pcelis 5.2.22 optimize
class LoggedInDrawer extends ConsumerWidget {
  const LoggedInDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final authState = ref.watch(authNotifierProvider);
    final fetchFromLiveState = ref.watch(fetchFromLiveDataStateProvider);
    final failRateState = ref.watch(failRateStateProvider);
    final mockTimer = ref.watch(mockTimeStateProvider).toDouble();
    final authController = ref.read(authNotifierProvider.notifier);
    final mockTimerController = ref.read(mockTimeStateProvider.notifier);
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final fetchFromLiveNotifier =
        ref.read(fetchFromLiveDataStateProvider.notifier);
    final failRateNotifier = ref.read(failRateStateProvider.notifier);
    bool neverFails = failRateState == 0;
    bool alwaysFails = failRateState == 1;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: authState.isVerified
                  ? const Icon(Icons.person)
                  : Container()),
          SwitchListTile(
            secondary: Icon(context.theme.isLightMode
                ? Icons.brightness_5
                : Icons.brightness_3),
            title: Text(context.theme.isLightMode ? 'Light Mode' : 'Dark Mode'),
            subtitle: const Text('Theme Mode'),
            value: context.theme.isLightMode,
            onChanged: (isDarkMode) {
              if (isDarkMode) {
                themeNotifier.toggleThemeMode(themeMode: ThemeMode.light);
              } else {
                themeNotifier.toggleThemeMode(themeMode: ThemeMode.dark);
              }
            },
          ),
          SwitchListTile(
            secondary:
                Icon(fetchFromLiveState ? Icons.cloud : Icons.data_saver_on),
            title: Text(
              fetchFromLiveState ? 'Wired to Live Data' : 'Wired to Mock Data',
            ),
            subtitle: const Text('Data Source'),
            value: fetchFromLiveState,
            onChanged: (value) => fetchFromLiveNotifier.state = value,
          ),
          if (!fetchFromLiveState) ...[
            ListTile(
              leading: Icon(
                neverFails ? Icons.health_and_safety : Icons.dangerous,
                color: alwaysFails ? context.theme.errorColor : null,
              ),
              title: Text('Mock Fail Rate: ${(failRateState * 100).round()} %'),
              subtitle: Slider(
                value: failRateState,
                onChanged: (value) => failRateNotifier.state = value,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: Text('Mock Delay Time: $mockTimer s'),
              subtitle: Slider(
                value: mockTimer,
                onChanged: (value) {
                  mockTimerController.state = value.truncate();
                },
                max: 3,
                min: 0,
              ),
            )
          ],
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            trailing: authState.isLoading
                ? ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 20, maxWidth: 20),
                    child: const Center(child: CircularProgressIndicator()))
                : null,
            onTap: authState.isLoading ? null : authController.signOut,
          ),
        ],
      ),
    );
  }
}

class LoggedInBottomNavBar extends StatelessWidget {
  const LoggedInBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);
    final currentRoute = goRouter.location;
    final currentIndex = _getIndex(currentRoute);
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

  int _getIndex(String route) {
    if (route == AppRouter.overviewRoute) {
      return 0;
    }

    if (route.contains(AppRouter.weatherOverviewRoute)) {
      return 1;
    }
    if (route == AppRouter.settingsRoute) {
      return 2;
    }
    throw 'Bad nav number';
  }
}

extension ThemeDataExtension on ThemeData {
  bool get isLightMode => brightness == Brightness.light;
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
