import 'package:flutter/material.dart';
import 'package:meditation_app/common_widget/tab_button.dart';
import 'package:meditation_app/screen/home/home_screen.dart';
import 'package:meditation_app/screen/home/spin_wheel/spin_wheel_screen.dart';
import 'package:meditation_app/screen/login/logout_screen.dart';
import 'package:meditation_app/screen/music/main_music_screen.dart';
import 'package:meditation_app/screen/pomodoro/pomodoro_screen.dart';

class MainTabViewScreen extends StatefulWidget {
  const MainTabViewScreen({super.key});

  @override
  State<MainTabViewScreen> createState() => _MainTabViewScreenState();
}

class _MainTabViewScreenState extends State<MainTabViewScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: const [
        HomeScreen(),
        PomodoroScreen(),
        MainMusicScreen(),
        SpinWheel(),
        LogoutScreen(),
      ]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 8),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 20, 41, 41),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 4, offset: Offset(0, -4))
            ]),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButton(
                icon: "assets/img/home_bar.png",
                title: "Home",
                isSelect: selectTab == 0,
                onPressed: () {
                  changeTab(0);
                }),
            TabButton(
                icon: "assets/img/focus_bar.png",
                title: "Focus",
                isSelect: selectTab == 1,
                onPressed: () {
                  changeTab(1);
                }),
            TabButton(
                icon: "assets/img/music_bar.png",
                title: "Music",
                isSelect: selectTab == 2,
                onPressed: () {
                  changeTab(2);
                }),
            TabButton(
                icon: "assets/img/spin_bar.png",
                title: "Spin Wheel",
                isSelect: selectTab == 3,
                onPressed: () {
                  changeTab(3);
                }),
            TabButton(
                icon: "assets/img/account_bar.png",
                title: "Logout",
                isSelect: selectTab == 4,
                onPressed: () {
                  changeTab(4);
                }),
          ],
        )),
      ),
    );
  }

  void changeTab(int index) {
    selectTab = index;
    controller?.animateTo(index);
    setState(() {});
  }
}
