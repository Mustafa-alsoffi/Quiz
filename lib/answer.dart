import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback stateHandler;
  final String answerText;
  Answer(this.stateHandler, this.answerText);


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
          ),
          child: Text(answerText),
          onPressed: stateHandler,
        ));
  }
}
