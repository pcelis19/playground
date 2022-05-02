import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  bool get isLightMode => themeData.brightness == Brightness.light;
  TextTheme get textTheme => themeData.textTheme;
  Size get size => MediaQuery.of(this).size;
  ResponsiveWrapperData get responsiveWrapper => ResponsiveWrapper.of(this);
}
