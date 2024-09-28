import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/progresswidget.dart';
import 'package:meditation_app/common_widget/timecontroller.dart';
import 'package:meditation_app/common_widget/timeoptions.dart';
import 'package:meditation_app/common_widget/timercard.dart';
import 'package:meditation_app/screen/main_tabview/main_tabview_screen.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Tcolor.primaryText,
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 40,
            height: 40,
            color: const Color.fromARGB(255, 15, 43, 40),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainTabViewScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          "Focus Timer",
          style: TextStyle(
            color: Color.fromARGB(255, 156, 213, 206),
            fontSize: 40,
            fontFamily: "normalcandy",
            fontWeight: FontWeight.w700,
          ),
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
          child: const Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TimerCard(),
              SizedBox(
                height: 40,
              ),
              TimeOptions(),
              SizedBox(
                height: 60,
              ),
              TimeController(),
              SizedBox(
                height: 70,
              ),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
