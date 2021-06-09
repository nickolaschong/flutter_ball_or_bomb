import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/ball_or_bomb.dart';

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

  // TODO listen for start and stop event

  @override
  Widget build(BuildContext context) {
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
          // curve: Curves.fastOutSlowIn,
          top: -widget.size,
          duration: const Duration(milliseconds: 1000),
          child: BallOrBomb(size: widget.size),
        ),
      ],
    );
  }
}
