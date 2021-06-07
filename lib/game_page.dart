import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/ball_or_bomb.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Size size;
  late double laneSize;
  List<double> position = [0.0, 0.0, 0.0];
  late double hiddenTop, hiddenBot;

  double generateTopPosition(double top) => Random().nextDouble() * top;

  @override
  void initState() {
    super.initState();
  }

  void changePosition() {
    setState(() {
      position[0] = 1;
    });
  }

  // TODO: Find alternate way to do repeat animation

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    laneSize = size.width / 3.0;
    hiddenTop = -laneSize - 100;
    hiddenBot = size.height;

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
            onEnd: () {
              setState(() {
                position[0] = position[0] == hiddenBot ? hiddenTop : hiddenBot;
              });
            },
            top: position[0],
            duration: const Duration(milliseconds: 1000),
            child: BallOrBomb(
              size: laneSize,
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
            top: 0,
            duration: const Duration(milliseconds: 700),
            child: InkWell(
              onTap: () => changePosition(),
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
