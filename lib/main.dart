

import 'package:atele_online/app/atele_online.dart';
import 'package:atele_online/core/database/cache/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
CacheHelper().init();
  runApp(const AteleOnline());
}

