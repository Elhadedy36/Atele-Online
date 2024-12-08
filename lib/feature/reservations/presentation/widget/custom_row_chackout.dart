import 'package:flutter/material.dart';


class CustomRowChackOut extends StatelessWidget {
  const CustomRowChackOut(
      {super.key, required this.title, required this.trallingText});
  final String title;
  final String trallingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          trallingText,
          style: TextStyle(color:Colors.orange,fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
