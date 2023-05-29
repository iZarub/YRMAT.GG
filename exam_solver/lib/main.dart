import 'package:exam_solver/defaults/colors.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF231F2E),
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: ColorConstants.firstTextColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
