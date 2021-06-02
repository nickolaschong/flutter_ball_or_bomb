import 'package:flutter/material.dart';

class BallOrBomb extends StatefulWidget {
  const BallOrBomb({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  _BallOrBombState createState() => _BallOrBombState();
}

class _BallOrBombState extends State<BallOrBomb> {
  @override
  void initState() {
    super.initState();
  }

  // TODO: Randomize bomb or ball
  // TODO: On click change to ball or bomb (randomize)

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
