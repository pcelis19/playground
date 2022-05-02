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
final fetchFromLiveDataStateProvider = StateProvider<bool>((_) => true);

final failRateStateProvider = StateProvider<double>((_) => 0);
