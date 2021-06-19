import 'package:flutter/material.dart';

class BallOrBomb extends StatelessWidget {
  const BallOrBomb({
    Key? key,
    required this.size,
    required this.color,
    required this.onTap,
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
