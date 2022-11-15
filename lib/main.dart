import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nueral_trainer/ui/onborading_pages.dart';
import 'package:nueral_trainer/utils/_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neural Trainer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: $styles.text.font.fontFamily),
      home: const OnBoardingPage(),
    );
  }
}
