import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'game_state.freezed.dart';

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
    (ref) => GameStateNotifier());

@freezed
class GameState with _$GameState {
  const factory GameState.idle() = Idle;
  const factory GameState.start() = Start;
  const factory GameState.stop() = Stop;
}

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(const GameState.idle());

  void idle() {
    state = const GameState.idle();
  }

  void start() {
    state = const GameState.start();
  }

  void stop() {
    state = const GameState.stop();
  }
}
