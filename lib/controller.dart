import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final readOnly = Provider<String>((ref) {
  return 'This is just read-only value';
});

final basicMutableState = StateProvider<int>((ref) {
  return 0;
});

final asyncDataState = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 'Imagine this is a result from API';
});

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
