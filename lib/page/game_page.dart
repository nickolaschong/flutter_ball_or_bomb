import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/constants.dart';
import 'package:flutter_ball_or_bomb/state/game_state.dart';
import 'package:flutter_ball_or_bomb/state/score_state.dart';
import 'package:flutter_ball_or_bomb/util/shared_pref_util.dart';
import 'package:flutter_ball_or_bomb/widget/game_lane.dart';
import 'package:flutter_ball_or_bomb/widget/game_timer.dart';
import 'package:flutter_ball_or_bomb/widget/score_board.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePage extends ConsumerWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final double laneWidth = size.width / 4.0;
    final double upperBound = size.height;

    ref.listen(gameStateProvider, (GameState state) {
      state.maybeWhen(
        over: () {
          _saveHighScore(ref);
          return _showGameOverDialog(context, ref);
        },
        orElse: () => {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('⚽ B•O•B 💣'),
        actions: GameConfig.isDebugMode
            ? [
                IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {
                      ref.read(gameStateProvider.notifier).start();
                    }),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    ref.read(gameStateProvider.notifier).stop();
                  },
                ),
              ]
            : [],
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: GameLane(
                  color: Colors.grey[300],
                  size: laneWidth,
                  upperBound: upperBound,
                ),
              ),
              Expanded(
                child: GameLane(
                  color: Colors.grey[200],
                  size: laneWidth,
                  upperBound: upperBound,
                ),
              ),
              Expanded(
                child: GameLane(
                  color: Colors.grey[100],
                  size: laneWidth,
                  upperBound: upperBound,
                ),
              ),
              Expanded(
                child: GameLane(
                  color: Colors.grey[50],
                  size: laneWidth,
                  upperBound: upperBound,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              GameTimer(),
              ScoreBoard(),
            ],
          ),
          Consumer(builder: (context, ref, child) {
            final gameState = ref.watch(gameStateProvider);
            return gameState == const GameState.stop()
                ? _showGameStartOverlay(ref)
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }

  Widget _showGameStartOverlay(WidgetRef ref) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: InkWell(
          child: const Icon(Icons.play_circle_fill,
              size: 100.0, color: Colors.white),
          onTap: () {
            ref.read(gameStateProvider.notifier).start();
          },
        ),
      ),
    );
  }

  Future<void> _showGameOverDialog(BuildContext context, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Your score is ${ref.read(scoreStateProvider)}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Restart?'),
              onPressed: () {
                ref.read(gameStateProvider.notifier).start();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _saveHighScore(WidgetRef ref) async {
    var currentScore = ref.read(scoreStateProvider);
    var currentHighScore = SharedPrefUtil.getHighScore();

    if (currentScore > currentHighScore) {
      SharedPrefUtil.saveHighScore(currentScore);
    }
  }
}
