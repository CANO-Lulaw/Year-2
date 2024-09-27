import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: TextStyle(
                  fontSize: 55,
                  color: Tcolor.textBG,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${provider.goal}/12",
              style: TextStyle(
                  fontSize: 55,
                  color: Tcolor.textBG,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "ROUND",
              style: TextStyle(
                  fontSize: 40,
                  color: Tcolor.textBG,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "GOAL",
              style: TextStyle(
                  fontSize: 40,
                  color: Tcolor.textBG,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
