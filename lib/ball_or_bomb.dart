import 'dart:math';

import 'package:flutter/material.dart';

class BallOrBomb extends StatefulWidget {
  const BallOrBomb({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  _BallOrBombState createState() => _BallOrBombState();
}

class _BallOrBombState extends State<BallOrBomb> {
  late Color _color;
  final List<Color> colorList = [
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.lime
  ];

  final _random = Random();
  final int _bombChancePercentage = 10;

  @override
  void initState() {
    _color = randomColor();
    super.initState();
  }

  Color randomColor() => colorList[_random.nextInt(colorList.length)];

  void randomBallOrBomb() {
    setState(() {
      _color = _random.nextInt(99) + 1 > _bombChancePercentage
          ? randomColor()
          : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: Colors.red,
          onTap: randomBallOrBomb,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: _color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
