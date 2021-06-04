import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late double topPosition;
  late double leftPosition;

  double generateTopPosition(double top) => Random().nextDouble() * top;

  @override
  void initState() {
    super.initState();
    topPosition = generateTopPosition(0);
  }

  void changePosition(double top) {
    setState(() {
      topPosition = generateTopPosition(top);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('BALL ⚽ or BOMB 💣'),
    );
    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [
          buildLane(Colors.grey[200]),
          buildLane(Colors.grey[100]),
          buildLane(Colors.grey[50]),

          // Expanded(
          //   child: Stack(
          //     children: [
          //       Container(color: Colors.grey[100]),
          //       AnimatedPositioned(
          //         width: size.width / 3,
          //         height: size.width / 3,
          //         top: topPosition,
          //         left: 0,
          //         duration: const Duration(seconds: 1),
          //         child: InkWell(
          //           onTap: () => changePosition(
          //               size.height - (appBar.preferredSize.height + 50)),
          //           child: const BallOrBomb(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Expanded(
          //   child: Container(color: Colors.grey[50]),
          // )
        ],
      ),
    );
  }

  Expanded buildLane(Color? color) {
    // final size = MediaQuery.of(context).size;

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
