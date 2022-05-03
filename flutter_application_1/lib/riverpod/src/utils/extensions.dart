import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ThemeDataExtension on ThemeData {
  bool get isLightMode => brightness == Brightness.light;
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ThemeData get themeData => Theme.of(this);
  bool get isLightMode => themeData.brightness == Brightness.light;
  TextTheme get textTheme => themeData.textTheme;
  Size get size => MediaQuery.of(this).size;
  ResponsiveWrapperData get responsiveWrapper => ResponsiveWrapper.of(this);
}

extension ThemeModeExtension on ThemeMode {
  bool get isLightMode => this == ThemeMode.light;
  bool get isDarkMode => this == ThemeMode.dark;
  bool get isSysteMode => this == ThemeMode.system;
}
