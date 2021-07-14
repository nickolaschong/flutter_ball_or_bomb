import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ball_or_bomb/constants.dart';
import 'package:flutter_ball_or_bomb/state/game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameTimer extends ConsumerStatefulWidget {
  const GameTimer({Key? key}) : super(key: key);

  @override
  _GameTimerState createState() => _GameTimerState();
}

class _GameTimerState extends ConsumerState<GameTimer>
    with TickerProviderStateMixin {
  late final Ticker _ticker;
  late AnimationController _controller;
  late Animation<Color?> _animation;

  Duration _elapsed = Duration.zero;
  int get _timeLeft => (GameConfig.gameDuration - _elapsed).inSeconds;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
        if (_timeLeft == 0) {
          ref.read(gameStateProvider.notifier).over();
        }
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: GameConfig.gameDuration,
    );

    _animation =
        ColorTween(begin: Colors.green, end: Colors.red).animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(gameStateProvider, (GameState state) {
      state.maybeWhen(
        start: () {
          _ticker.start();
          _controller.reset();
          _controller.forward();
        },
        stop: () {
          _ticker.stop();
          _controller.stop();
        },
        orElse: () {
          _ticker.stop();
          _controller.stop();
        },
      );
    });

    return Container(
      color: _animation.value,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Time left: $_timeLeft',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
