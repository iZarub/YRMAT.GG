import 'package:flutter/material.dart';
import 'colors.dart';
import 'api.dart';

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

class InputForm extends StatefulWidget {
  const InputForm(
      {super.key, required this.pholders, required this.wolframUri});

  final List pholders;
  final String wolframUri;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool _isAnswered = false;
  String _answer = '';

  List<TextField> textFields = [];
  List<TextEditingController> textEditingControllers = [];

  @override
  void initState() {
    super.initState();

    textEditingControllers = List.generate(
      widget.pholders.length,
      (index) => TextEditingController(),
    );

    for (String elem in widget.pholders) {
      textFields.add(
        TextField(
          controller: textEditingControllers[widget.pholders.indexOf(elem)],
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: elem,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String generateUri() {
    var defaultUri = widget.wolframUri + '?first=';
    for (var controller in textEditingControllers) {
      if (controller.text == '') {
        throw Exception('Заполните поля');
      }
    }

    Map indexToString = {
      0: 'first',
      1: 'second',
      2: 'third',
      3: 'fourth',
      4: 'fifth',
    };

    for (var conIndex = 1;
        conIndex <= textEditingControllers.length;
        conIndex += 1) {
      if (conIndex != textEditingControllers.length) {
        defaultUri +=
            textEditingControllers[conIndex - 1].text.replaceAll('+', '%2B') +
                '&${indexToString[conIndex]}=';
      } else {
        defaultUri += textEditingControllers[textEditingControllers.length - 1]
            .text
            .replaceAll('+', '%2B');
      }
    }

    debugPrint(defaultUri);

    return defaultUri;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var textField in textFields)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12.0),
            child: textField,
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEB8E8A), // background
            foregroundColor: Colors.white, // foreground
          ),
          onPressed: () async {
            try {
              var response = await getSolution(generateUri());

              setState(() {
                _isAnswered = true;
                if (response.success == false) {
                  _answer = response.success.toString();
                }
                _answer = response.result;
              });
            } on Exception {
              //Skip
            }
          },
          child: const Text('Evaluate'),
        ),
        const SectionText(text: 'Answer'),
        (_isAnswered
            ? Answer(answer: _answer)
            : const Text('Заполните поля и нажмите кнопку')),
      ],
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
