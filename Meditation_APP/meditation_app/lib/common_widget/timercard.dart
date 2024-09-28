import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    final seconds = provider.currentDuration % 60;

    return Column(children: [
      const Text(
        "FOCUS",
        style: TextStyle(
          color: Color.fromARGB(255, 177, 228, 221),
          fontSize: 70,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3.2,
            height: 170,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 154, 213, 199),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2))
              ],
            ),
            child: Center(
              child: Text(
                (provider.currentDuration ~/ 60).toString(),
                style: const TextStyle(
                    fontSize: 85,
                    color: Color.fromARGB(255, 14, 81, 66),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            ":",
            style: TextStyle(
                fontFamily: "normal",
                fontSize: 100,
                color: Color.fromARGB(255, 154, 213, 199),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Container(
            width: MediaQuery.of(context).size.width / 3.2,
            height: 170,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 154, 213, 199),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2))
              ],
            ),
            child: Center(
              child: Text(
                seconds == 0
                    ? "${seconds.round()}0"
                    : seconds.round().toString(),
                style: const TextStyle(
                    fontSize: 85,
                    color: Color.fromARGB(255, 14, 81, 66),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
