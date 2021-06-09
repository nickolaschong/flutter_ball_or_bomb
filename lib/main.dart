import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/game_page.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      Wakelock.enable();
    }

    return MaterialApp(
      title: 'BALL ⚽ or BOMB 💣',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      // home: const GamePage(),
      home: GamePage(),
    );
  }
}
