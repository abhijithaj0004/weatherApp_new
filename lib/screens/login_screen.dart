// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:login/constants/constants.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final nameController = TextEditingController();

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final passController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              kheight,
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'UserName'),
              ),
              kheight,
              TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  controller: passController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Password')),
              kheight,
              ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      final sharedpref = await SharedPreferences.getInstance();
                      await sharedpref.setBool(userLoggedin, true);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                    }
                  },
                  child: const Text('LogIn')),
            ],
          ),
        ),
      ),
    );
  }
}
