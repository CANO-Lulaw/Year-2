import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/firebase_options.dart';
import 'package:meditation_app/screen/home/home_screen.dart';
import 'package:meditation_app/screen/login/startup_screen.dart';
import 'package:meditation_app/screen/pomodoro/pomodoro_screen.dart';
import 'package:meditation_app/screen/pomodoro/timeservice.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider<TimeService>(
    create: (_) => TimeService(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 44, 64, 67),
        fontFamily: "normalcandy",
        appBarTheme: const AppBarTheme(
            elevation: 0, backgroundColor: Colors.transparent),
        colorScheme: ColorScheme.fromSeed(seedColor: Tcolor.primary),
        useMaterial3: false,
      ),
      home: const StartUpScreen(),
    );
  }
}
