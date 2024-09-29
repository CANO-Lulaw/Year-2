import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:meditation_app/screen/main_tabview/main_tabview_screen.dart';
import 'package:rxdart/rxdart.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({super.key});

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final selected = BehaviorSubject<int>();
  final List<int> items = [55, 40, 5, 60, 35, 50, 30, 20, 15, 10, 25, 45];
  int time = 0;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 40,
            height: 40,
            color: const Color.fromARGB(255, 128, 174, 158),
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
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Random time to focus!",
              style: TextStyle(
                color: Color.fromRGBO(171, 228, 219, 1),
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: FortuneWheel(
                selected: selected.stream,
                animateFirst: false,
                items: [
                  for (int item in items)
                    FortuneItem(
                      child: Text(
                        item.toString(),
                        style: TextStyle(
                            fontFamily: "normalcandy",
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                ],
                onAnimationEnd: () {
                  setState(() {
                    time = items[selected.value!];
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "The time you need to focus is " +
                            time.toString() +
                            " mins",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 171, 240, 230),
                        ),
                      ),
                      backgroundColor: const Color.fromARGB(137, 21, 91, 77),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected.add(Fortune.randomInt(0, items.length));
                });
              },
              child: Container(
                height: 50,
                width: 150,
                color: const Color.fromARGB(255, 133, 167, 160),
                child: const Center(
                  child: Text("SPIN",
                      style: TextStyle(color: Colors.white, fontSize: 50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
