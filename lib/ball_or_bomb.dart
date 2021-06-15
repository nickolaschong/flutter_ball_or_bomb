import 'dart:math';

import 'package:flutter/material.dart';

class BallOrBomb extends StatefulWidget {
  const BallOrBomb({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  _BallOrBombState createState() => _BallOrBombState();
}

class _BallOrBombState extends State<BallOrBomb> {
  late Color _currentColor;
  final Color bombColor = Colors.black;
  final List<Color> ballColors = [
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.lime
  ];

  final _random = Random();
  final int _bombChancePercentage = 20;

  @override
  void initState() {
    _currentColor = randomColor();
    super.initState();
  }

  Color randomColor() => ballColors[_random.nextInt(ballColors.length)];

  void randomBallOrBomb() {
    setState(() {
      _currentColor = _random.nextInt(99) + 1 > _bombChancePercentage
          ? randomColor()
          : bombColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO onclick hide the container
    return AnimatedCircularContainer(
      size: widget.size,
      color: _currentColor,
      onTap: randomBallOrBomb,
    );
  }
}

class AnimatedCircularContainer extends StatelessWidget {
  const AnimatedCircularContainer({
    Key? key,
    required this.size,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  final double size;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: Colors.red,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
