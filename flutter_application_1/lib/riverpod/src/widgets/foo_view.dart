import 'package:flutter/material.dart';

class FooView extends StatelessWidget {
  final String title;
  const FooView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text('$title body'),
      ),
    );
  }
}
