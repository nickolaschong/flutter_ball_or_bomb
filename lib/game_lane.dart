import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/ball_or_bomb.dart';
import 'package:flutter_ball_or_bomb/game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';

class GameLane extends StatefulWidget {
  const GameLane({
    Key? key,
    required this.color,
    required this.size,
    required this.upperBound,
  }) : super(key: key);

  final Color? color;
  final double size;
  final double upperBound;

  @override
  _GameLaneState createState() => _GameLaneState();
}

class _GameLaneState extends State<GameLane>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Color _currentBallColor;
  final _random = Random();
  Color randomColor() => ballColors[_random.nextInt(ballColors.length)];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      upperBound: widget.upperBound,
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _currentBallColor = randomColor();
        _controller.reset();
        _controller.forward();
      }
    });

    _currentBallColor = randomColor();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener<GameState>(
      provider: gameStateProvider,
      onChange: (context, state) {
        state.maybeWhen(
          start: () => _controller.forward(),
          stop: () => _controller.reset(),
          orElse: () => _controller.reset(),
        );
      },
      child: Consumer(
        builder: (context, watch, child) {
          final state = watch(gameStateProvider);

          return Stack(
            children: [
              child!,
              Positioned(
                top: _controller.value,
                child: Listener(
                  onPointerDown: (e) {
                    setState(() {
                      _controller.reset();
                      _controller.forward();
                    });
                  },
                  child: BallOrBomb(
                    size: state == const GameState.start() ? widget.size : 0,
                    color: _currentBallColor,
                    onTap: randomBallOrBomb,
                  ),
                ),
              ),
            ],
          );
        },
        child: Container(color: widget.color),
      ),
    );
  }

  void randomBallOrBomb() {
    setState(() {
      _currentBallColor = _random.nextInt(99) + 1 > bombChancePercentage
          ? randomColor()
          : bombColor;
    });
  }
}
