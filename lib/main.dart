import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/animated_ball.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BALL ⚽ or BOMB 💣',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BALL ⚽ or BOMB 💣'),
      ),
      body: const Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: AnimatedBall(),
        ),
      ),
    );
  }
}
