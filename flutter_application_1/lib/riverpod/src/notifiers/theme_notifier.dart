import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/utils/extensions.dart';
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
