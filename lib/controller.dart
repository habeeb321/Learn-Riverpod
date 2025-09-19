import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = Provider<String>((ref) {
  return 'This is for just read-only value';
});
