import 'package:flutter/material.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 10),()
    {
      //navigate to login screen
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}