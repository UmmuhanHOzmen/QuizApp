import 'package:assingment3/Screens/QuizPage.dart';
import 'package:assingment3/Screens/SecQuizPage.dart';
import 'package:flutter/material.dart';

void gotoQuizPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => QuizPage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                'Study Tests',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue[100], width: 1),
                color: Colors.blue[50]),
            child: FlatButton(
              splashColor: Colors.blue,
              onPressed: () {
                gotoQuizPage(context);
              },
              child: Text('Mathematics'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue[100], width: 1),
                color: Colors.blue[50]),
            child: FlatButton(
              splashColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecQuizPage(),
                  ),
                );
              },
              child: Text('English'),
            ),
          ),
        ],
      ),
    );
  }
}
