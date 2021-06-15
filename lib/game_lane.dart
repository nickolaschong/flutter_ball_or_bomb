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
  late double position;

  @override
  void initState() {
    position = widget.lowerBound;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener<GameState>(
      provider: gameStateProvider,
      onChange: (context, state) {
        state.maybeWhen(
          start: () => position += 1,
          stop: () => position = position,
          orElse: () => position = widget.lowerBound + 1,
        );
      },
      child: Consumer(
        builder: (context, watch, child) {
          final state = watch(gameStateProvider);

          return Stack(
            children: [
              child!,
              AnimatedPositioned(
                onEnd: () {
                  if (state == const GameState.stop()) return;
                  setState(() {
                    position = position == widget.upperBound
                        ? widget.lowerBound
                        : widget.upperBound;
                  });
                },
                // curve: Curves.linear,
                top: position,
                duration: const Duration(milliseconds: 1500),
                child: BallOrBomb(
                  size: state == const GameState.stop() ? 0 : widget.size,
                ),
              ),
            ],
          );
        },
        child: Container(color: widget.color),
      ),
    );
  }
}
