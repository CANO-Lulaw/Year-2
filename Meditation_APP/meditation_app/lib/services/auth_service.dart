import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditation_app/screen/home/home_screen.dart';
// import 'package:meditation_app/screen/login/startup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> signup({
    required String username,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);

      Fluttertoast.showToast(
        msg: "Sign Up Successful!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(137, 21, 91, 77),
        textColor: const Color.fromARGB(255, 171, 240, 230),
        fontSize: 14.0,
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = 'An error occurred. Please try again.';
      }

      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(137, 21, 91, 77),
        textColor: const Color.fromARGB(255, 171, 240, 230),
        fontSize: 14.0,
      );
    } catch (e) {}
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Fluttertoast.showToast(
        msg: "Sign In Successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(137, 21, 91, 77),
        textColor: const Color.fromARGB(255, 171, 240, 230),
        fontSize: 14.0,
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = 'An error occurred. Please try again.';
      }

      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color.fromARGB(137, 21, 91, 77),
        textColor: const Color.fromARGB(255, 171, 240, 230),
        fontSize: 14.0,
      );
    } catch (e) {}
  }

  // Future<void> signout({required BuildContext context}) async {
  //   await FirebaseAuth.instance.signOut();
  //   await Future.delayed(const Duration(seconds: 1));
  //   Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (BuildContext context) => StartUpScreen()));
  // }
}
