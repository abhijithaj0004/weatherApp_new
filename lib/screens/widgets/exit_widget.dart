import 'package:flutter/material.dart';

class ExitWidget extends StatelessWidget {
  const ExitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to exit?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('Yes'),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'))
      ],
    );
  }
}
