import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key, required this.text1, required this.text2, this.onTap});
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: text1,
              style: TextStyle(color: Colors.black.withOpacity(0.6))),
          TextSpan(text: text2, style: const TextStyle(color: Colors.blue))
        ])),
      ),
    );
  }
}
