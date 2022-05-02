import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.dark);

  void toggleThemeMode({ThemeMode? themeMode}) {
    if (themeMode != null) {
      state = themeMode;
    } else {
      if (state.isLightMode) {
        state = ThemeMode.dark;
      } else {
        state = ThemeMode.light;
      }
    }
  }
}

extension ThemeModeExtension on ThemeMode {
  bool get isLightMode => this == ThemeMode.light;
  bool get isDarkMode => this == ThemeMode.dark;
  bool get isSysteMode => this == ThemeMode.system;
}
