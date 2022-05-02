import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final authState = ref.watch(authNotifierProvider);
    final controller = ref.read(authNotifierProvider.notifier);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Login View'),
          ),
          TextButton(
            onPressed: authState.isLoading ? null : controller.logIn,
            child: const Text('Login'),
          ),
          if (authState.isLoading) ...const [
            SizedBox(height: 8),
            Center(child: CircularProgressIndicator())
          ]
        ],
      ),
    );
  }
}
