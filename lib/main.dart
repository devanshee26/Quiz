import 'package:flutter/material.dart';
import 'package:quiz/quiz1.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Quiz(),
  ));
}

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Quiz"),
        backgroundColor: Colors.cyan,
      ),
      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new MaterialButton(
              height: 50.0,
              color: Colors.cyan,
              onPressed: startQuiz,
              child: new Text(
                "Subject 1",
                style: new TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  //method to start the quiz

  void startQuiz() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz1()));
    });
  }
}
