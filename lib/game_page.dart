import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/game_lane.dart';
import 'package:flutter_ball_or_bomb/game_state.dart';
import 'package:flutter_ball_or_bomb/game_timer.dart';
import 'package:flutter_ball_or_bomb/score_board.dart';
import 'package:flutter_ball_or_bomb/score_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double laneWidth = size.width / 4.0;
    final double upperBound = size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BALL ⚽ or BOMB 💣'),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              context.read(gameStateProvider.notifier).start();
            },
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () {
              context.read(gameStateProvider.notifier).stop();
            },
          ),
        ],
      ),
      body: ProviderListener<GameState>(
        provider: gameStateProvider,
        onChange: (context, state) {
          state.maybeWhen(
            over: () => _showGameOverDialog(context),
            orElse: () => {},
          );
        },
        child: Stack(
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
          ],
        ),
      ),
    );
  }

  Future<void> _showGameOverDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Your score is ${context.read(scoreStateProvider)}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Restart?'),
              onPressed: () {
                context.read(gameStateProvider.notifier).start();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
