import 'package:flutter_riverpod/flutter_riverpod.dart';

final scoreStateProvider = StateNotifierProvider<ScoreNotifier, int>((ref) {
  return ScoreNotifier();
});

class ScoreNotifier extends StateNotifier<int> {
  ScoreNotifier() : super(0);

  void increment() => state++;
  void reset() => state = 0;
}
