import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/notifiers/theme_notifier.dart';
import 'package:flutter_application_1/riverpod/src/routing/app_router.dart';
import 'package:riverpod/riverpod.dart';

/// provides the apps router to the application
final appRouterProvider =
    Provider<AppRouter>((ref) => AppRouter.init(ref.read));

/// provides the app's theme to the application, while the ability
/// to change it too
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((_) => ThemeNotifier());

/// * Provides state on where the application is retrieving it's data from
///
/// * allows the application to change where the data comes from be,
/// i.e., live or mock
final fetchFromLiveDataStateProvider = StateProvider<bool>((_) => true);

/// * Provides state on the fail rate the mock data will have.
/// * `0` means that it will never fail, while `1` means always fails
/// * offers the application the ability to change the fail rate too
final failRateStateProvider = StateProvider<double>((_) => 0);
