import 'package:flutter/material.dart';

class Tcolor {
  static Color get primary => const Color.fromARGB(255, 123, 191, 176);
  static Color get secondary => const Color.fromARGB(255, 10, 91, 85);
  static Color get tertiary => const Color.fromARGB(255, 45, 168, 159);

  static Color get primaryText => const Color.fromARGB(255, 10, 91, 85);
  static Color get primaryTextW => const Color.fromARGB(255, 49, 203, 175);
  static Color get secondaryText => const Color.fromARGB(255, 49, 203, 175);
  static Color get textBG => Colors.black;
}

extension AppContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  Future push(Widget widget) async {
    return Navigator.push(
        this, MaterialPageRoute(builder: (context) => widget));
  }

  void pop() async {
    return Navigator.pop(this);
  }
}
