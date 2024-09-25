import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "Focus",
        style: TextStyle(
          color: Color.fromARGB(255, 177, 228, 221),
          fontSize: 70,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(
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
                    offset: Offset(0, 2))
              ],
            ),
            child: const Center(
              child: Text(
                '12',
                style: TextStyle(
                    fontSize: 85,
                    color: Color.fromARGB(255, 14, 81, 66),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
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
          SizedBox(width: 10),
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
                    offset: Offset(0, 2))
              ],
            ),
            child: const Center(
              child: Text(
                '00',
                style: TextStyle(
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
