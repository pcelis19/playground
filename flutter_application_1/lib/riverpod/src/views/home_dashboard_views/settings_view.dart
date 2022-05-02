import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/widgets/foo_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FooView(title: 'Settings');
}
