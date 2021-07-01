import 'package:flutter/material.dart';
import 'package:flutter_ball_or_bomb/score_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  bool _isAnimateScoreText = false;
  late final TextStyle defaultTextStyle, scaleTextStyle;

  @override
  void initState() {
    defaultTextStyle = const TextStyle(
      fontSize: 26,
      color: Colors.brown,
      fontWeight: FontWeight.bold,
    );
    scaleTextStyle = defaultTextStyle.copyWith(fontSize: 50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener<int>(
      provider: scoreStateProvider,
      onChange: (context, state) {
        setState(() {
          _isAnimateScoreText = state != 0 ? true : false;
        });
      },
      child: Consumer(
        builder: (context, ref, child) {
          final scoreState = ref(scoreStateProvider);

          return Container(
            color: Colors.white,
            height: 60,
            child: AnimatedDefaultTextStyle(
              child: Center(
                child: Text('$scoreState'),
              ),
              style: _isAnimateScoreText ? scaleTextStyle : defaultTextStyle,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
              onEnd: () {
                setState(() {
                  _isAnimateScoreText = false;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
