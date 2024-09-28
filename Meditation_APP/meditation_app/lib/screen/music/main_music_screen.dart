import 'package:flutter/material.dart';
import 'package:meditation_app/common_widget/category_card.dart';
import 'package:meditation_app/screen/home/home_screen.dart';
import 'package:meditation_app/screen/main_tabview/main_tabview_screen.dart';

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
                  height: 10,
                ),
                const Text("relax melody to help you",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 125, 176, 156),
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
                        title: "Frog",
                        picScr: "assets/img/home_bar.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Waterfall",
                        picScr: "assets/img/forestw.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Forest",
                        picScr: "assets/img/forest.jpg",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Rain",
                        picScr: "assets/img/music_bar.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Rain",
                        picScr: "assets/img/music_bar.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Rain",
                        picScr: "assets/img/music_bar.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Rain",
                        picScr: "assets/img/music_bar.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Rain",
                        picScr: "assets/img/music_bar.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      CategoryCrad(
                        title: "Rain",
                        picScr: "assets/img/music_bar.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
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
