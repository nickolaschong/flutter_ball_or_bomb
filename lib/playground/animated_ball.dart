import 'package:flutter/material.dart';

class AnimatedBall extends StatefulWidget {
  const AnimatedBall({Key? key}) : super(key: key);

  @override
  _AnimatedBallState createState() => _AnimatedBallState();
}

class _AnimatedBallState extends State<AnimatedBall> {
  double _begin = 1.0;
  double _end = 1.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: _begin, end: _end),
      duration: const Duration(milliseconds: 500),
      builder: (_, opacity, child) {
        return AnimatedOpacity(
          opacity: opacity,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            _begin = 1.0;
            _end = 0.0;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
