import 'package:flutter/material.dart';
import 'package:login/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('LogOut?'),
      content: Text('Do you want to LogOut?'),
      actions: [
        TextButton(
            onPressed: () async {
              final sharedPref = await SharedPreferences.getInstance();
              sharedPref.clear();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
            },
            child: Text('yes')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'))
      ],
    );
  }
}
