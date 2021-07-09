import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/ball_or_bomb.dart';
import 'package:flutter_ball_or_bomb/constants.dart';
import 'package:flutter_ball_or_bomb/state/game_state.dart';
import 'package:flutter_ball_or_bomb/state/score_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  late Animation<double> _animation;

  late Color _currentBallColor;
  final _random = Random();
  Color randomColor() =>
      GameConfig.ballColors[_random.nextInt(GameConfig.ballColors.length)];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentBallColor = randomColor();
          _controller.reset();
          _controller.forward();
        });
      }
    });

    _animation =
        Tween<double>(begin: 0, end: widget.upperBound).animate(_controller);

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
          start: () {
            context.read(scoreStateProvider.notifier).reset();
            _controller.forward();
          },
          stop: () => _controller.reset(),
          orElse: () => _controller.reset(),
        );
      },
      child: Consumer(
        builder: (context, ref, child) {
          final gameState = ref(gameStateProvider);
          return Stack(
            children: [
              child!,
              TopPositionTransition(
                child: Listener(
                  onPointerDown: (e) {
                    setState(() {
                      _controller.reset();
                      _controller.forward();
                    });
                  },
                  child: BallOrBomb(
                    size:
                        gameState == const GameState.start() ? widget.size : 0,
                    color: _currentBallColor,
                    onTap: _onBallOrBombTap,
                  ),
                ),
                animation: _animation,
              )
            ],
          );
        },
        child: Container(color: widget.color),
      ),
    );
  }

  void _randomBallOrBomb() {
    setState(() {
      _currentBallColor =
          _random.nextInt(99) + 1 > GameConfig.bombChancePercentage
              ? randomColor()
              : GameConfig.bombColor;
    });
  }

  void _onBallOrBombTap() {
    if (_currentBallColor != GameConfig.bombColor) {
      context.read(scoreStateProvider.notifier).increment();
      _randomBallOrBomb();
    } else {
      context.read(gameStateProvider.notifier).over();
    }
  }
}

class TopPositionTransition extends AnimatedWidget {
  const TopPositionTransition({
    Key? key,
    required Animation<double> animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Positioned(top: animation.value, child: child);
  }
}
