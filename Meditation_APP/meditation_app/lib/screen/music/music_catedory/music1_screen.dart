import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Music1Screen extends StatefulWidget {
  const Music1Screen({super.key});

  @override
  State<Music1Screen> createState() => _Music1ScreenState();
}

class _Music1ScreenState extends State<Music1Screen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration? duration;
  Duration? position;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    setupPlaylist();
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

  void setupPlaylist() async {
    await audioPlayer.setAsset("assets/music/music1.mp3");
    audioPlayer.setVolume(1);
    audioPlayer.setLoopMode(LoopMode.one);
  }

  void stopAndReset() async {
    await audioPlayer.stop();
    await audioPlayer.seek(Duration.zero);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  Widget circularAudioPlayer(double screenWidth) {
    Color primaryColor = const Color.fromARGB(255, 200, 226, 225);

    double percent =
        (position != null && duration != null && duration!.inSeconds > 0)
            ? position!.inSeconds / duration!.inSeconds
            : 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: screenWidth / 4,
          lineWidth: 8,
          startAngle: 270,
          backgroundColor: const Color.fromARGB(255, 181, 212, 201),
          progressColor: const Color.fromARGB(255, 74, 111, 108),
          percent: percent,
          center: IconButton(
            iconSize: screenWidth / 6,
            color: primaryColor,
            highlightColor: const Color.fromARGB(255, 160, 190, 180),
            splashColor: const Color.fromARGB(255, 64, 132, 124),
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
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Relaxing Piano",
          style: TextStyle(
            color: Color.fromRGBO(37, 67, 63, 1),
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/music00.jpg"),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.center,
            child: circularAudioPlayer(MediaQuery.of(context).size.width),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                stopAndReset();
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/img/back.png",
                width: 40,
                height: 40,
                color: const Color.fromARGB(255, 154, 212, 208),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
