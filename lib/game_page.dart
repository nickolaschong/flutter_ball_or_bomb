import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/game_lane.dart';
import 'package:flutter_ball_or_bomb/game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double laneWidth = size.width / 3.0;
    final double lowerBound = -laneWidth;
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
      body: Column(
        children: [
          const Placeholder(
            fallbackHeight: 50,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GameLane(
                    color: Colors.grey[200],
                    size: laneWidth,
                    lowerBound: lowerBound,
                    upperBound: upperBound,
                  ),
                ),
                Expanded(
                  child: GameLane(
                    color: Colors.grey[100],
                    size: laneWidth,
                    lowerBound: lowerBound,
                    upperBound: upperBound,
                  ),
                ),
                Expanded(
                  child: GameLane(
                    color: Colors.grey[50],
                    size: laneWidth,
                    lowerBound: lowerBound,
                    upperBound: upperBound,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
