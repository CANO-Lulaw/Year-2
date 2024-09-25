import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/timercard.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Tcolor.primaryText,
        title: Text(
          "Focus Timer",
          style: TextStyle(
            color: const Color.fromARGB(255, 156, 213, 206),
            fontSize: 40,
            fontFamily: "normalcandy",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TimerCard(),
            ],
          ),
        ),
      ),
    );
  }
}
