import 'package:assingment3/Screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage({Key key, this.score}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState(score);
}

class _ResultPageState extends State<ResultPage> {
  List<String> images = [
    "images/passed.jpg",
    "images/failed.jpg",
  ];
  String message;
  String image;
  void initState() {
    if (score < 30) {
      image = images[1];
      message = "You should study harder!!";
    } else {
      image = images[0];
      message = "Well Done!!";
    }
    ;
    super.initState();
  }

  int score;
  _ResultPageState(this.score);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(50),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(image),
                  ),
                ),
                Text(message),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(50),
            child: Text(
              ' Score: ${widget.score}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            child: FlatButton(
              splashColor: Colors.blue,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
                setState(() {});
              },
              padding: EdgeInsets.all(10),
              child: Text('Continue To Quiz'),
            ),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: Colors.blue[200], width: 2),
            ),
          ),
        ],
      ),
    );
  }
}
