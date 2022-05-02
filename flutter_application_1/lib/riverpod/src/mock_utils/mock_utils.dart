import 'dart:math';

import 'package:riverpod/riverpod.dart';

final mockTimeStateProvider = StateProvider<int>((_) => 2);
final mockTimeProvider = Provider<Duration>(
    (ref) => Duration(seconds: ref.watch(mockTimeStateProvider)));

final random = Random();
@Deprecated('Needs better implementation')
Future<void> mockDelay(Reader reader, {bool? throws}) async {
  final mockTime = reader(mockTimeProvider);
  await Future.delayed(mockTime);
  if (throws == true) {
    if (random.nextBool()) {
      throw Exception('Mock throw');
    }
  }
}
