// TODO pcelis 5.2.22 optimize
import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/mock_utils/mock_utils.dart';
import 'package:flutter_application_1/riverpod/src/providers/app_providers.dart';
import 'package:flutter_application_1/riverpod/src/providers/auth_providers.dart';
import 'package:flutter_application_1/riverpod/src/providers/mock_providers.dart';
import 'package:flutter_application_1/riverpod/src/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggedInDrawer extends ConsumerWidget {
  const LoggedInDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final fetchingLiveData = ref.watch(fetchFromLiveDataStateProvider);
    final authState = ref.watch(authNotifierProvider);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: authState.isVerified ? const Icon(Icons.person) : null,
          ),
          const _AppThemeController(),
          const _DataSourceController(),
          if (!fetchingLiveData) ...[
            const _MockFailRateController(),
            const _MockTimerController()
          ],
          const _SignOutButton(),
        ],
      ),
    );
  }
}

class _SignOutButton extends ConsumerWidget {
  const _SignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authController = ref.read(authNotifierProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.logout),
      title: const Text('Sign out'),
      trailing: authState.isLoading
          ? ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
              child: const Center(child: CircularProgressIndicator()))
          : null,
      onTap: authState.isLoading ? null : authController.signOut,
    );
  }
}

class _MockFailRateController extends ConsumerWidget {
  const _MockFailRateController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final failRateState = ref.watch(failRateStateProvider);
    final failRateNotifier = ref.read(failRateStateProvider.notifier);
    bool neverFails = failRateState == 0;
    bool alwaysFails = failRateState == 1;
    final Color? iconColor = neverFails
        ? Colors.green
        : alwaysFails
            ? context.theme.errorColor
            : null;
    return ListTile(
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: Icon(
          neverFails ? Icons.health_and_safety : Icons.dangerous,
          key: Key(iconColor?.toString() ?? ''),
          color: iconColor,
        ),
      ),
      title: Text('Mock Fail Rate: ${(failRateState * 100).round()}%'),
      subtitle: Slider(
        value: failRateState,
        onChanged: (value) => failRateNotifier.state = value,
      ),
    );
  }
}

class _MockTimerController extends ConsumerWidget {
  const _MockTimerController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mockTimer = ref.watch(mockTimeStateProvider).toDouble();
    final mockTimerController = ref.read(mockTimeStateProvider.notifier);
    return ListTile(
      leading: const Icon(Icons.timer),
      title: Text('Mock Delay Time: ${mockTimer}s'),
      subtitle: Slider(
        value: mockTimer,
        onChanged: (value) {
          mockTimerController.state = value.truncate();
        },
        max: 3,
        min: 0,
      ),
    );
  }
}

class _DataSourceController extends ConsumerWidget {
  const _DataSourceController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchFromLiveState = ref.watch(fetchFromLiveDataStateProvider);
    final fetchFromLiveNotifier =
        ref.read(fetchFromLiveDataStateProvider.notifier);
    return SwitchListTile(
      secondary: Icon(fetchFromLiveState ? Icons.cloud : Icons.data_saver_on),
      title: Text(
        fetchFromLiveState ? 'Wired to Live Data' : 'Wired to Mock Data',
      ),
      subtitle: const Text('Data Source'),
      value: fetchFromLiveState,
      onChanged: (value) => fetchFromLiveNotifier.state = value,
    );
  }
}

class _AppThemeController extends ConsumerWidget {
  const _AppThemeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    return SwitchListTile(
      secondary: Icon(
          context.theme.isLightMode ? Icons.brightness_5 : Icons.brightness_3),
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
    );
  }
}
