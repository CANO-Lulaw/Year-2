import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meditation_app/common/%E0%B8%B5utils.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 200),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: selectableTimes.map((time) {
        return InkWell(
          onTap: () => provider.selectTime(double.parse(time)),
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            width: 70,
            height: 50,
            decoration: int.parse(time) == provider.selectedTime
                ? BoxDecoration(
                    color: const Color.fromARGB(255, 154, 213, 199),
                    borderRadius: BorderRadius.circular(8))
                : BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: const Color.fromARGB(75, 152, 255, 234)),
                    borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: "normalcandy",
                    color: int.parse(time) == provider.selectedTime
                        ? Tcolor.secondary
                        : const Color.fromARGB(255, 154, 213, 199),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        );
      }).toList()),
    );
  }
}
