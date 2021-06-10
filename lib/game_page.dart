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
      ),
      body: Row(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(gameStateProvider.notifier).start(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
