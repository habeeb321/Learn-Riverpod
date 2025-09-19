import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Provider for basic read-only value.
final readOnly = Provider<String>((ref) {
  return 'This is just read-only value';
});

// StateProvider for basic mutable value like int, string, bool.
final basicMutableState = StateProvider<int>((ref) {
  return 0;
});

// FutureProvider for API calls like async data handling.
final asyncDataState = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 'Imagine this is a result from API';
});

// StateNotifierProvider for complex logic and customised controllers.
class Counter extends StateNotifier<int> {
  Counter() : super(0);

  int increment() {
    return state++;
  }

  int decrement() {
    return state--;
  }
}

final counterNotifierProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});
