import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'game_state.freezed.dart';

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
    (ref) => GameStateNotifier());

@freezed
class GameState with _$GameState {
  const factory GameState.start() = Start;
  const factory GameState.stop() = Stop;
  const factory GameState.over() = Over;
}

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(const GameState.stop());

  void start() {
    state = const GameState.start();
  }

  void stop() {
    state = const GameState.stop();
  }

  void over() {
    state = const GameState.over();
  }
}
