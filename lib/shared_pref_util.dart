import 'package:flutter_ball_or_bomb/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static Future<SharedPreferences> init() async {
    _sharedPref = await SharedPreferences.getInstance();
    return _sharedPref;
  }

  static late final SharedPreferences _sharedPref;
  static get instance => _sharedPref;

  static int getHighScore() {
    return _sharedPref.getInt(SharedPrefKey.highScore) ?? 0;
  }

  static Future<bool> saveHighScore(int value) {
    return _sharedPref.setInt(SharedPrefKey.highScore, value);
  }
}
