import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import './themes.dart';
import './custom_theme.dart';

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.BLUE,
      child: MyApp(),
    ),
  );
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
        {'text': 'Yellow', 'score': 1}
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
        {'text': 'Dr. Shahida', 'score': 1},
        {'text': 'Dr. Zatul', 'score': 5},
        {'text': 'Dr. Halina', 'score': 9},
        {'text': 'Dr. Zahpira', 'score': 12},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }


  void selectThemeColor(int score, BuildContext context) {
    if (_questionIndex == 0) {
    switch (score) {
      case 10:
        _changeTheme(context, MyThemeKeys.BLACK);
        break;
      case 5:
        _changeTheme(context, MyThemeKeys.RED);
        break;
      case 3:
        _changeTheme(context, MyThemeKeys.GREEN);
        break;
      case 1:
        _changeTheme(context, MyThemeKeys.YELLOW);
        break;
      default:
        _changeTheme(context, MyThemeKeys.BLUE);
    }
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score, BuildContext context) {

selectThemeColor(score, context);

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.of(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestions: (_totalScore, context) =>
                    _answerQuestion(_totalScore, context),
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
/**/
