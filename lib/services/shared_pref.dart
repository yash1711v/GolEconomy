import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static final Pref _obj = Pref._internal();

  static Pref get instance => _obj;

  late SharedPreferences pref;

  factory Pref() {
    return _obj;
  }

  Pref._internal();

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }
}