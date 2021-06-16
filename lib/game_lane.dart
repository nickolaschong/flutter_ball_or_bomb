import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/ball_or_bomb.dart';
import 'package:flutter_ball_or_bomb/game_state.dart';
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
          start: () => _controller.repeat(),
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
                      Future.delayed(
                          Duration(milliseconds: Random().nextInt(50)), () {
                        _controller.repeat();
                      });
                    });
                  },
                  child: BallOrBomb(
                    size: state == const GameState.stop() ? 0 : widget.size,
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
}

// class GameLane extends StatefulWidget {
//   const GameLane({
//     Key? key,
//     required this.color,
//     required this.size,
//     required this.lowerBound,
//     required this.upperBound,
//   }) : super(key: key);
//
//   final Color? color;
//   final double size;
//   final double lowerBound;
//   final double upperBound;
//
//   @override
//   _GameLaneState createState() => _GameLaneState();
// }
//
// class _GameLaneState extends State<GameLane> {
//   late double _position;
//   late int _speedInMs;
//
//   @override
//   void initState() {
//     _position = widget.lowerBound;
//     _speedInMs = 1500;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ProviderListener<GameState>(
//       provider: gameStateProvider,
//       onChange: (context, state) {
//         state.maybeWhen(
//           start: () => _position += 1,
//           stop: () => _position = _position,
//           orElse: () => _position = widget.lowerBound + 1,
//         );
//       },
//       child: Consumer(
//         builder: (context, watch, child) {
//           final state = watch(gameStateProvider);
//
//           return Stack(
//             children: [
//               child!,
//               AnimatedPositioned(
//                 onEnd: () {
//                   if (state == const GameState.stop()) return;
//                   setState(() {
//                     _position = _position == widget.upperBound
//                         ? widget.lowerBound
//                         : widget.upperBound;
//                     _speedInMs = 2000;
//                   });
//                 },
//                 top: _position,
//                 duration: Duration(milliseconds: _speedInMs),
//                 child: Listener(
//                   onPointerDown: (e) {
//                     setState(() {
//                       _speedInMs = 1;
//                       _position = widget.lowerBound;
//                     });
//                   },
//                   child: BallOrBomb(
//                     size: state == const GameState.stop() ? 0 : widget.size,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//         child: Container(color: widget.color),
//       ),
//     );
//   }
// }
