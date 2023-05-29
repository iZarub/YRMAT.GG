import 'package:exam_solver/defaults/colors.dart';
import 'package:flutter/material.dart';
import 'exercises.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'YRMAT.GG',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ),
        drawer: const MyNavigationDrawer(),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  'Здарова пацанва',
                  style: TextStyle(
                    fontSize: 30,
                    color: ColorConstants.firstTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    'images/preview.jpg',
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
