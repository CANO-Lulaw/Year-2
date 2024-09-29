import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/round_button.dart';
import 'package:meditation_app/common_widget/round_button2.dart';
import 'package:meditation_app/screen/music/main_music_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music1_screen.dart';
import 'package:meditation_app/screen/pomodoro/pomodoro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List rArr = [
    {
      "image": "assets/img/pic1.jpg",
      "title": "Smiling cat",
      "subtitle": "A little cat is sleeping on the grass.",
    },
    {
      "image": "assets/img/pic2.jpg",
      "title": "Lazy frog",
      "subtitle": "The frog is thinking about tonight.",
    },
    {
      "image": "assets/img/pic4.jpg",
      "title": "Two foxes",
      "subtitle": "A fox couple sleeping together.",
    },
    {
      "image": "assets/img/pic0.jpg",
      "title": "Multicolored cat",
      "subtitle": "Cats take a nap.",
    },
    {
      "image": "assets/img/pic5.jpg",
      "title": "Tiny squirrel",
      "subtitle": "Little one smells the flowers.",
    },
  ];

  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '...Focus Forest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to , $username!",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 185, 227, 219),
                      fontSize: 55,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "What are you felling today?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 185, 227, 219),
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 50, 103, 91),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/img/frog.png",
                                    width: 75,
                                    height: 75,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Relax Music",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 171, 226, 217),
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      "start to relax",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 172, 202, 197),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "3-10 Min",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 145, 172, 168),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        RoundButton2(
                                            title: "START",
                                            textSize: 25,
                                            buttonWidth: 70,
                                            buttonHeight: 40,
                                            textcolor: const Color.fromARGB(
                                                255, 29, 88, 92),
                                            buttoncolor: const Color.fromARGB(
                                                255, 166, 215, 203),
                                            onPressed: () {
                                              context.push(
                                                  const MainMusicScreen());
                                            })
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 103, 167, 160),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/img/focus.png",
                                    width: 75,
                                    height: 75,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Focus time",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 32, 79, 70),
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "start to focus",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 32, 79, 70),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "5-60 Min",
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 32, 79, 70),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        RoundButton2(
                                            title: "START",
                                            textSize: 25,
                                            buttonWidth: 70,
                                            buttonHeight: 40,
                                            buttoncolor: const Color.fromARGB(
                                                255, 22, 70, 70),
                                            onPressed: () {
                                              context
                                                  .push(const PomodoroScreen());
                                            }),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Tcolor.tertiary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/img/forestw.png",
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Good day",
                                      style: TextStyle(
                                        color: Tcolor.secondary,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "in 6 min",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 157, 254, 236),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RoundButton2(
                                  title: "Play",
                                  icon: Image.asset(
                                    "assets/img/play.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  textSize: 25,
                                  buttonWidth: 70,
                                  buttonHeight: 40,
                                  textcolor: Tcolor.secondary,
                                  buttoncolor:
                                      const Color.fromARGB(255, 207, 240, 233),
                                  onPressed: () {
                                    context.push(const Music1Screen());
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Animals help you relax",
                    style: TextStyle(
                      color: Color.fromARGB(255, 185, 227, 219),
                      fontSize: 55,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.width * 0.35 * 0.7 + 50 + 40,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var r0bj = rArr[index];
                  return SizedBox(
                    width: context.width * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          r0bj["image"],
                          width: context.width * 0.30,
                          height: context.width * 0.4 * 0.6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          r0bj["title"],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 185, 227, 219),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          r0bj["subtitle"],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 185, 227, 219),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemCount: rArr.length,
              ),
            )
          ],
        )),
      ),
    );
  }
}
