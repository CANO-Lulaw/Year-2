import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:meditation_app/screen/pomodoro/pomodoro_screen.dart';
import 'package:meditation_app/common_widget/timercard.dart';
import 'package:meditation_app/common_widget/timecontroller.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration? duration;
  Duration? position;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    setupMusic();
    audioPlayer.durationStream.listen((d) {
      setState(() => duration = d);
    });
    audioPlayer.positionStream.listen((p) {
      setState(() => position = p);
    });
    audioPlayer.playerStateStream.listen((playerState) {
      final processingState = playerState.processingState;
      setState(() {
        isPlaying =
            playerState.playing && processingState != ProcessingState.completed;
      });
    });
  }

  void setupMusic() async {
    await audioPlayer.setAsset("assets/music/music2.mp3");
    audioPlayer.setVolume(1);
    audioPlayer.setLoopMode(LoopMode.one);
    await audioPlayer.play();
  }

  void stopMusic() async {
    await audioPlayer.stop();
    await audioPlayer.seek(Duration.zero);
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 40,
            height: 40,
            color: const Color.fromARGB(255, 196, 205, 204),
          ),
          onPressed: () {
            stopMusic(); // Stop music when back is pressed
            provider.reset();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const PomodoroScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            iconSize: 40,
            color: const Color.fromARGB(255, 226, 235, 251),
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow_rounded,
            ),
            onPressed: () async {
              if (isPlaying) {
                await audioPlayer.pause();
              } else {
                await audioPlayer.play();
              }
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 156, 213, 206),
            ),
            iconSize: 40,
            onPressed: () {
              provider.reset();
              stopMusic();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/img/view.gif",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: const Column(
                children: [
                  SizedBox(height: 25),
                  TimerCard(),
                  SizedBox(height: 40),
                  TimeController(),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
