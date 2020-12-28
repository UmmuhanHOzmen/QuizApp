import 'package:assingment3/Screens/ResultPage.dart';
import 'package:assingment3/Service/Question.dart';
import 'package:assingment3/Service/QuizManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizManager _manager = QuizManager();

  List<Widget> getOptions(Question question) {
    List<Widget> optionsButtons = [];
    for (int i = 0; i < question.options.length; i++) {
      optionsButtons.add(FlatButton(
        onPressed: () {
          _manager.nextQuestion(_manager.getCurrentQuestion().options[i].score);

          if (_manager.isFinished()) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ResultPage(
                      score: _manager.getTotalScore(),
                    )));
          }
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: Colors.blue[200], width: 2),
          ),
          child: Text(
            '${_manager.getCurrentQuestion().options[i].text}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ));
    }
    return optionsButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Question ${_manager.getCurrentPageId()}/${_manager.totalQuestionNumber()}'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1),
                    color: Colors.blue[50]),
                child: Text(
                  '${_manager.getCurrentQuestion().text}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: getOptions(
                  _manager.getCurrentQuestion(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
