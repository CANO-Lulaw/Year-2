import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/round_button.dart';
import 'package:meditation_app/screen/login/login_screen.dart';
import 'package:meditation_app/screen/login/sign_up_screen.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/forest.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/logo1.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ],
              )
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 350),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Worry less, smile more",
                        style: TextStyle(
                          color: Color.fromRGBO(171, 228, 219, 1),
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "The journey of a thousand miles begins with one step.",
                        style: TextStyle(
                          color: Color.fromRGBO(171, 228, 219, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundButton(
                  title: "SIGN UP",
                  onPressed: () {
                    context.push(const SignUpScreen());
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ALREADY HAVE AN ACCOUNT ?",
                    style: TextStyle(
                      color: Color.fromRGBO(171, 228, 219, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(const LoginScreen());
                    },
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Tcolor.tertiary,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
