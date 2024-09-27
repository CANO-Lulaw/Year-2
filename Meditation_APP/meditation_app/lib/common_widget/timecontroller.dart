import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:provider/provider.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Tcolor.secondary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: provider.timerPlaying
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow_sharp),
        color: const Color.fromARGB(255, 154, 228, 222),
        iconSize: 35,
        onPressed: () {
          provider.timerPlaying
              ? Provider.of<TimeService>(context, listen: false).pause()
              : Provider.of<TimeService>(context, listen: false).start();
        },
      ),
    );
  }
}
