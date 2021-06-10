import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/ball_or_bomb.dart';
import 'package:flutter_ball_or_bomb/game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameLane extends StatefulWidget {
  const GameLane({
    Key? key,
    required this.color,
    required this.size,
    required this.lowerBound,
    required this.upperBound,
  }) : super(key: key);

  final Color? color;
  final double size;
  final double lowerBound;
  final double upperBound;

  @override
  _GameLaneState createState() => _GameLaneState();
}

class _GameLaneState extends State<GameLane> {
  double position = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(gameStateProvider);
        state.maybeMap(
          idle: (_) => print('idle'),
          start: (_) {
            print('start ${DateTime.now()}');
            position = widget.upperBound;
          },
          stop: (_) => print('stop'),
          orElse: () => print('orElese'),
        );
        return Stack(
          children: [
            Container(color: widget.color),
            AnimatedPositioned(
              onEnd: () {
                setState(() {
                  position = position == widget.upperBound
                      ? widget.lowerBound
                      : widget.upperBound;
                });
              },
              curve: Curves.fastOutSlowIn,
              top: position,
              duration: const Duration(milliseconds: 1500),
              child: BallOrBomb(size: widget.size),
            ),
          ],
        );
      },
    );
  }
}
