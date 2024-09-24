import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common_widget/round_button.dart';
import 'package:meditation_app/common_widget/round_text_field.dart';
import 'package:meditation_app/screen/login/startup_screen.dart';
import 'package:meditation_app/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StartUpScreen(),
                  ),
                );
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
                        "Create your account",
                        style: TextStyle(
                          color: Color.fromRGBO(171, 228, 219, 1),
                          fontSize: 60,
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
                    "or Create with email",
                    style: TextStyle(
                      color: Color.fromRGBO(171, 228, 219, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RoundTextField(
                hintText: "Username",
                controller: usernameController,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                hintText: "Email address",
                controller: emailController,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 30),
              RoundButton(
                  title: "Get start",
                  onPressed: () async {
                    await AuthService().signup(
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      context: context,
                    );
                  }),
              const SizedBox(height: 60),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 525),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "i have read the ",
                            style: TextStyle(
                              fontFamily: "normalcandy",
                              color: Color.fromRGBO(171, 228, 219, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "privacy policy",
                            style: TextStyle(
                              fontFamily: "normalcandy",
                              color: Color.fromRGBO(96, 223, 204, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
