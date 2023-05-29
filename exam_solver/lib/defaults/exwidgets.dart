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
            color: const Color(0xFF231F2E),
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: ColorConstants.firstTextColor, width: 2),
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
            color: Colors.white,
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
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: ColorConstants.secondTextColor, width: 2),
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
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class InputLine extends StatefulWidget {
  const InputLine({super.key, required this.pholders});

  final String pholders;

  @override
  State<InputLine> createState() => _InputLine();
}

class _InputLine extends State<InputLine> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.pholders,
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
