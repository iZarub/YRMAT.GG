import 'package:exam_solver/homepage.dart';
import 'package:flutter/material.dart';
import 'defaults/exwidgets.dart';

const Map exercisesMap = {
  'Причинная функция Грина': {
    'Theory':
        'В данной задаче находится причинная функция Грина при помощи уравнения на функцию Грина и преобразования Лапласа.',
    'Inputs': {
      0: 'Введите оператор...',
      1: 'Введите пределы...',
    },
    'WolframAPI': {
      'http://wolframcloud.com',
    }
  },
  'Уравнение Бюргерса': {
    'Theory': 'Чето про уравнение Бюргерса',
    'Inputs': {
      0: 'Введите уравнение...',
    },
    'WolframAPI': {
      'http://wolframcloud.com',
    }
  },
};

String getTheoryByTitle(String title) {
  return exercisesMap[title]['Theory'];
}

List getInputsByTitle(String title) {
  return exercisesMap[title]['Inputs'].values.toList();
}

String getApiByTitle(String title) {
  return exercisesMap[title]['WolframAPI'];
}

const exerciseIcon = Icons.menu_book;

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: createTileList(context)),
    );
  }

  List<Widget> createTileList(context) {
    var exsTiles = <Widget>[];

    exsTiles.add(
      ListTile(
        leading: const Icon(Icons.home_filled),
        //title: const Text('Home Page'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
    );

    exsTiles.add(const Divider());

    for (String title in exercisesMap.keys.toList()) {
      exsTiles.add(
        ListTile(
          leading: const Icon(exerciseIcon),
          title: Text(title),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ExercisePage(title: title);
                },
              ),
            );
          },
        ),
      );
    }
    return exsTiles;
  }
}

class ExercisePage extends StatefulWidget {
  final String title;

  const ExercisePage({super.key, required this.title});

  @override
  State<ExercisePage> createState() => _ExercisePage();
}

class _ExercisePage extends State<ExercisePage> {
  final bool _isAnswered = false;
  late String _answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ),
      drawer: const MyNavigationDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SectionText(text: "Theory"),
          Theory(
            theory: getTheoryByTitle(widget.title),
          ),
          const SectionText(text: 'Inputs'),
          Column(
            children: createInputFields(getInputsByTitle(widget.title)),
          ),
          ElevatedButton(
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
          ),
          const SectionText(text: "Answer"),
          (_isAnswered
              ? Answer(answer: _answer)
              : const Text('Заполните поля и нажмите кнопку')),
        ],
      ),
    );
  }

  createInputFields(List placeHolders) {
    var inputs = <InputLine>[];
    for (String element in placeHolders) {
      inputs.add(InputLine(pholder: element));
    }
    return inputs;
  }
}
