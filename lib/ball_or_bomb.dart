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
  final Color _bombColor = Colors.black;
  final List<Color> _ballColors = [
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.lime
  ];
  late double size;

  final _random = Random();
  final int _bombChancePercentage = 10;

  @override
  void initState() {
    _currentColor = randomColor();
    size = widget.size;
    super.initState();
  }

  Color randomColor() => _ballColors[_random.nextInt(_ballColors.length)];

  void randomBallOrBomb() {
    setState(() {
      _currentColor = _random.nextInt(99) + 1 > _bombChancePercentage
          ? randomColor()
          : _bombColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      size: widget.size,
      color: _currentColor,
      onTap: randomBallOrBomb,
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
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
          splashFactory: InkRipple.splashFactory,
          onTap: onTap,
          onLongPress: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
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
