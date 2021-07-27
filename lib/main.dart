import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 8},
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        {'text': 'Bao', 'score': 1},
        {'text': 'Max', 'score': 5},
        {'text': 'Jack', 'score': 9},
        {'text': 'Lawvien', 'score': 12},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

void _resetQuiz() {
  setState(() {
  _questionIndex = 0;
  _totalScore = 0;
  });
}
void _answerQuestion(int score) {
    _totalScore += score;
    print('NOTICE: MyApp answerQuestion func triggered score is $_totalScore');
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestions: (_totalScore) => _answerQuestion(_totalScore),
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
/**/
