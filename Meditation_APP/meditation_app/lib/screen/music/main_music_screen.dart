import 'package:flutter/material.dart';
import 'package:meditation_app/common_widget/category_card.dart';
import 'package:meditation_app/screen/home/home_screen.dart';
import 'package:meditation_app/screen/main_tabview/main_tabview_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music10_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music11_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music12_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music1_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music2_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music3_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music4_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music5_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music6_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music7_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music8_screen.dart';
import 'package:meditation_app/screen/music/music_catedory/music9_screen.dart';

class MainMusicScreen extends StatelessWidget {
  const MainMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.3,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/img/tapfoerst.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTabViewScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 52,
                      width: 52,
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(
                        "assets/img/back.png",
                        width: 40,
                        height: 40,
                        color: const Color.fromARGB(255, 56, 87, 85),
                      ),
                    ),
                  ),
                ),
                const Text("Ready to relax",
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 29, 88, 92),
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text("Relaxing melodies\nthat will help you",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 172, 216, 200),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    children: <Widget>[
                      CategoryCrad(
                        title: "Piano",
                        picScr: "assets/img/icon1.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music1Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "rain",
                        picScr: "assets/img/icon2.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music2Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Frog",
                        picScr: "assets/img/icon3.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music3Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Bird",
                        picScr: "assets/img/icon4.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music4Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Magic",
                        picScr: "assets/img/icon5.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music5Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Moon",
                        picScr: "assets/img/icon6.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music6Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Wind",
                        picScr: "assets/img/icon7.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music7Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Ocean wave",
                        picScr: "assets/img/icon8.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music8Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Campfire",
                        picScr: "assets/img/icon9.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music9Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Forest",
                        picScr: "assets/img/icon10.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music10Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Waterfall",
                        picScr: "assets/img/icon11.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music11Screen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Evening",
                        picScr: "assets/img/icon12.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music12Screen()),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
