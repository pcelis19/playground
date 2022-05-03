import 'package:riverpod/riverpod.dart';

/// provides how long the mock delay timer is set for
final mockTimeStateProvider = StateProvider<int>((_) => 2);

/// provides a duration based on the mock time state
final mockDurationProvider = Provider<Duration>((ref) {
  final seconds = ref.watch(mockTimeStateProvider);
  return Duration(seconds: seconds);
});
