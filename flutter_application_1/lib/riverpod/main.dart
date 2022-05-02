import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/src/providers/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ProviderScope(child: _App()));
}

class _App extends ConsumerWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final appRouter = ref.read(appRouterProvider);
    final goRouter = appRouter.goRouter;
    return Consumer(builder: (_, nestedRef, __) {
      final currentThemeMode = nestedRef.watch(themeNotifierProvider);
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: (_, widget) => ResponsiveWrapper.builder(widget),
        themeMode: currentThemeMode,
        darkTheme: ThemeData.dark(),
        routeInformationParser: goRouter.routeInformationParser,
        routerDelegate: goRouter.routerDelegate,
      );
    });
  }
}
