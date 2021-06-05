import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/ball_or_bomb.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late double topPosition;
  late double leftPosition;
  late double laneSize;

  double generateTopPosition(double top) => Random().nextDouble() * top;

  @override
  void initState() {
    super.initState();
    topPosition = generateTopPosition(0);
  }

  void changePosition(double top) {
    setState(() {
      topPosition = generateTopPosition(500);
    });
  }
  // TODO: Auto animate position from top to bottom

  @override
  Widget build(BuildContext context) {
    laneSize = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BALL ⚽ or BOMB 💣'),
      ),
      body: Row(
        children: [
          buildLane(Colors.grey[200]),
          buildLane(Colors.grey[100]),
          buildLane3(Colors.grey[50]),
        ],
      ),
    );
  }

  Widget buildLane3(Color? color) {
    return Expanded(
      child: Stack(
        children: [
          Container(color: color),
          AnimatedPositioned(
            top: topPosition,
            left: 0,
            duration: const Duration(seconds: 1),
            child: InkWell(
              onTap: () => changePosition(50),
              child: BallOrBomb(
                size: laneSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLane(Color? color) {
    return Expanded(
      child: Stack(
        children: [
          Container(color: color),
          AnimatedPositioned(
            top: topPosition,
            duration: const Duration(seconds: 1),
            child: InkWell(
              onTap: () => changePosition(50),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Click Me',
                  style: TextStyle(
                    color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
