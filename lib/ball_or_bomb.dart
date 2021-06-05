import 'dart:math';

import 'package:flutter/material.dart';

class BallOrBomb extends StatefulWidget {
  const BallOrBomb({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  _BallOrBombState createState() => _BallOrBombState();
}

class _BallOrBombState extends State<BallOrBomb> {
  final _random = Random();
  final int _bombChancePercentage = 30;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  void randomBallOrBomb() {
    setState(() {
      _color = _random.nextInt(99) + 1 > _bombChancePercentage
          ? Colors.blue
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
