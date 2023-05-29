import 'package:exam_solver/homepage.dart';
import 'package:flutter/material.dart';
import 'defaults/exwidgets.dart';
import 'defaults/api.dart';

import 'package:http/http.dart' as http;

const Map exercisesMap = {
  'Причинная функция Грина': {
    'Theory':
        'В данной задаче находится причинная функция Грина при помощи уравнения на функцию Грина и преобразования Лапласа.',
    'Inputs': {
      0: 'Введите дифф. оператор L[dt]',
    },
    'WolframAPI':
        'https://www.wolframcloud.com/obj/0999eaae-79d7-41d3-b0e9-ee66c048a5c0',
  },
  'Задача Коши c гран. условиями': {
    'Theory': 'Чето про здачу Коши',
    'Inputs': {
      0: 'Введите дифф. оператор L[dt]',
      1: 'Введите правую часть уравнения g[t]',
      2: "Введите нач. условия в виде {f(0), f'(0), f''(0)}",
    },
    'WolframAPI':
        'https://www.wolframcloud.com/obj/6db7ec6a-5d95-4543-8db4-68cdaf829bc6',
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
        leading: const Icon(
          Icons.home_filled,
          color: Colors.white,
        ),
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
          leading: const Icon(
            exerciseIcon,
            color: Colors.white,
          ),
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
          InputForm(
            pholders: getInputsByTitle(widget.title),
            wolframUri: getApiByTitle(widget.title),
          ),
        ],
      ),
    );
  }
}
