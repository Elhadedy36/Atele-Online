import 'package:atele_online/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class AteleOnline extends StatelessWidget {
  const AteleOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}