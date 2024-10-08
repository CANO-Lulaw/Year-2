import 'dart:async';
import 'package:flutter/material.dart';

class TimeService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentDuration--;
      notifyListeners();
    });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentDuration = selectedTime = 1500;
    timerPlaying = false;
    notifyListeners();
  }
}
