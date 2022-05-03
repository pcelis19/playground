import 'dart:math';

import 'package:flutter_application_1/riverpod/src/providers/mock_providers.dart';
import 'package:riverpod/riverpod.dart';

final random = Random();
@Deprecated('Needs better implementation')

///
Future<void> mockDelay(Reader reader, {bool? throws}) async {
  final mockDuration = reader(mockDurationProvider);
  await Future.delayed(mockDuration);
  if (throws == true) {
    if (random.nextBool()) {
      throw Exception('Mock throw');
    }
  }
}
