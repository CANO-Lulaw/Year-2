import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/round_button.dart';
import 'package:meditation_app/common_widget/round_text_field.dart';
import 'package:meditation_app/screen/login/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/img/forest.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            color: Color.fromRGBO(171, 228, 219, 1),
                            fontSize: 80,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 200),
                RoundButton(
                  icon: Image.asset(
                    "assets/img/google.png",
                    width: 40,
                    height: 40,
                  ),
                  title: "continue with google",
                  textSize: 30,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "or login with email",
                      style: TextStyle(
                        color: Color.fromRGBO(171, 228, 219, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const RoundTextField(hintText: "Email address"),
                const SizedBox(height: 20),
                const RoundTextField(
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                RoundButton(title: "Log in", onPressed: () {}),
                const SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Create a new account?",
                      style: TextStyle(
                        color: Color.fromRGBO(171, 228, 219, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Tcolor.tertiary,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
