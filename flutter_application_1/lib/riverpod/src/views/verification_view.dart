import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationView extends ConsumerWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.read(authNotifierProvider.notifier);
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Verify Profile'),
          const SizedBox(height: 8),
          TextButton(
            onPressed: controller.verify,
            child: const Text('Verify'),
          )
        ],
      ),
    );
  }
}
