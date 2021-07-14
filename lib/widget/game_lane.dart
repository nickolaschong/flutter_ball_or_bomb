import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/constants.dart';
import 'package:flutter_ball_or_bomb/state/game_state.dart';
import 'package:flutter_ball_or_bomb/state/score_state.dart';
import 'package:flutter_ball_or_bomb/widget/ball_or_bomb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameLane extends ConsumerStatefulWidget {
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

class _GameLaneState extends ConsumerState<GameLane>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late Color _currentBallColor;
  final _random = Random();
  Color randomColor() =>
      GameConfig.ballColors[_random.nextInt(GameConfig.ballColors.length)];

  @override
  void initState() {
    _randomBallOrBomb();

    _controller = AnimationController(
      vsync: this,
      duration: GameConfig.dropSpeed,
    );

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _randomBallOrBomb();
        setState(() {
          _controller.reset();
          _controller.forward();
        });
      }
    });

    _animation =
        Tween<double>(begin: 0, end: widget.upperBound).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(gameStateProvider, (GameState state) {
      state.maybeWhen(
        start: () {
          ref.read(scoreStateProvider.notifier).reset();
          _randomBallOrBomb();
          _controller.forward();
        },
        stop: () => _controller.reset(),
        orElse: () => _controller.reset(),
      );
    });

    final gameState = ref.watch(gameStateProvider);
    return Stack(
      children: [
        Container(color: widget.color),
        TopPositionTransition(
          child: Listener(
            onPointerDown: (e) {
              setState(() {
                _controller.reset();
                _controller.forward();
              });
            },
            child: BallOrBomb(
              size: gameState == const GameState.start() ? widget.size : 0,
              color: _currentBallColor,
              onTap: _onBallOrBombTap,
            ),
          ),
          animation: _animation,
        )
      ],
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
      ref.read(scoreStateProvider.notifier).increment();
      _randomBallOrBomb();
    } else {
      ref.read(gameStateProvider.notifier).over();
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
