import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestions;
  final List<Map<String, Object>> questions;
  final int questionIndex;
  Quiz(
      {required this.answerQuestions,
      required this.questionIndex,
      required this.questions});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          (questions[questionIndex]['questionText'] as String),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          print('NOTICE: Bulding buttons...');
          return Answer(
              () => answerQuestions(answer['score'], context),
              answer['text'].toString());
        }).toList(),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
