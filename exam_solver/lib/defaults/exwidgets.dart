import 'package:flutter/material.dart';
import 'colors.dart';

class Theory extends StatelessWidget {
  const Theory({super.key, required this.theory});

  final String theory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: ColorConstants.secondMainColor,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 3),
                blurRadius: 3.0,
              ),
            ]),
        child: Text(
          theory,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({super.key, required this.answer});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: ColorConstants.secondMainColor,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 3),
                blurRadius: 3.0,
              ),
            ]),
        child: Text(
          answer,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class InputLine extends StatelessWidget {
  const InputLine({super.key, required this.pholder});

  final String pholder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: pholder,
        ),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  const SectionText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFFEB8E8A),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Solution extends StatelessWidget {
  const Solution({super.key, required this.solution});

  final String solution;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: const Color(0xFF292533),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 3),
                blurRadius: 3.0,
              ),
            ]),
        child: Text(
          solution,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

Widget evaluatebutton = ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFEB8E8A), // background
    foregroundColor: Colors.white, // foreground
  ),
  onPressed: () {},
  child: const Text(
    'Evaluate',
    style: TextStyle(
      fontSize: 16,
    ),
  ),
);
