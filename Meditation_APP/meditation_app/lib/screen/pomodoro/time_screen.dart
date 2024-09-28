import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/progresswidget.dart';
import 'package:meditation_app/common_widget/round_button2.dart';
import 'package:meditation_app/common_widget/timecontroller.dart';
import 'package:meditation_app/common_widget/timeoptions.dart';
import 'package:meditation_app/common_widget/timercard.dart';
import 'package:meditation_app/screen/main_tabview/main_tabview_screen.dart';
import 'package:meditation_app/screen/pomodoro/pomodoro_screen.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:provider/provider.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 40,
            height: 40,
            color: const Color.fromARGB(255, 15, 43, 40),
          ),
          onPressed: () {
            Provider.of<TimeService>(context, listen: false).reset();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const PomodoroScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 156, 213, 206),
            ),
            iconSize: 40,
            onPressed: () =>
                Provider.of<TimeService>(context, listen: false).reset(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const TimerCard(),
              const SizedBox(
                height: 40,
              ),
              const TimeController(),
              const SizedBox(
                height: 70,
              ),
              RoundButton2(
                  title: "START",
                  textSize: 50,
                  buttonWidth: 100,
                  buttonHeight: 100,
                  textcolor: const Color.fromARGB(255, 21, 53, 41),
                  buttoncolor: const Color.fromARGB(255, 108, 150, 123),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
