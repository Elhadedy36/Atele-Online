import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {super.key,
      required this.title,
      required this.trallingText,
      this.style1,
      this.style2});
  final String title;
  final String trallingText;
  final TextStyle? style1;
  final TextStyle? style2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: style1,maxLines: 2,overflow: TextOverflow.ellipsis, ),
        Row(
          children: [
            Text(trallingText, style: style2,),
          ],
        ),
      ],
    );
  }
}
