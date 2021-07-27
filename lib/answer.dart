import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback stateHandler;
  final String answerText;
  Answer(this.stateHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          child: Text(answerText),
          onPressed:stateHandler,
        ));
  }
}