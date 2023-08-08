// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userLoggedin = 'user_logged_in';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  Splash splash = Splash();

  @override
  Widget build(BuildContext context) {
    splash.gotoLogin(context);

    return Scaffold(
      body: Center(
        child: Text('splash screen'),
      ),
    );
  }
}

class Splash {
  Future<void> gotoLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    final sharedpref = await SharedPreferences.getInstance();
    final userLogin = sharedpref.getBool(userLoggedin);
    userLogin == null || userLogin == false
        ? Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ))
        : Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
  }
}
