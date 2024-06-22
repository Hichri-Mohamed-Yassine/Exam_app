import 'dart:collection';

import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            "Exam",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  void checkAnswer(bool whatUserPicked) {
    bool? correctAnswer = questionGroup[questionNumber].questionAnswer;
    setState(() {
      if (whatUserPicked == correctAnswer) {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }

      questionNumber++;
    });
  }

  /*List<String> questions = [
    "The number of planets in the solar system is eight",
    "cats is Carnivorous",
    "China is located on the African continent",
    "The Earth is flat, not spherical"
  ];
  List<String> questionImage = [
    "images/image-1.jpg",
    "images/image-2.jpg",
    "images/image-3.jpg",
    "images/image-4.jpg"
  ];
  List<bool> answers = [true, true, false, false];
  */
  List<Question> questionGroup = [
    Question(
        q: "The number of planets in the solar system is eight",
        i: "images/image-1.jpg",
        a: true),
    Question(q: "cats is Carnivorous", i: "images/image-2.jpg", a: true),
    Question(
        q: "China is located on the African continent",
        i: "images/image-3.jpg",
        a: false),
    Question(
        q: "The Earth is flat, not spherical",
        i: "images/image-4.jpg",
        a: false),
    Question(
        q: "Humans can survive without eating meat",
        i: "images/image-5.jpg",
        a: true),
    Question(
        q: "The sun revolves around the earth and the earth revolves around the moon",
        i: "images/image-6.jpg",
        a: false),
    Question(q: "Animals do not feel pain", i: "images/image-7.jpg", a: false),
  ];

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(
                  questionGroup[questionNumber].questionImage.toString()),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                questionGroup[questionNumber].questionText.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  "True",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  "False",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                )),
          ),
        )
      ],
    );
  }
}
