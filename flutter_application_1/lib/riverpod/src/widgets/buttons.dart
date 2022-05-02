import 'package:flutter/material.dart';

/// note icon should be 48
class OversizeIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String label;

  const OversizeIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
