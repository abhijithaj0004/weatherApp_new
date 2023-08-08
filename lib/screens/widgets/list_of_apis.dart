import 'package:flutter/material.dart';

class ListOfApi extends StatelessWidget {
  const ListOfApi({
    super.key,
    required this.title,
    required this.valueoftitle,
  });
  final String title;
  final String valueoftitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              '$title :',
              style: TextStyle(fontSize: 20),
            ),
            Text(valueoftitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}