// import 'dart:html';
// import 'dart:js';
// import 'dart:ui';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:quiz/main.dart';

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Quiz1State();
  }
}

var finalScore = 0;
var questionNo = 0;
var quiz = new QuizData();

class QuizData {
  var question = [
    "How are you?",
    "What is your name?",
    "Where do you come from?"
  ];
  var options = [
    ["fine", "awesome", "good", "ok"],
    ["sweetie", "devanshee", "sahil", "stranger"],
    ["rajkot", "surat", "toranto", "paris"]
  ];
  var answers = ["awesome", "devanshee", "rajkot"];
}

class _Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Question ${questionNo + 1} of ${quiz.question.length}",
                        style: new TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      new Text(
                        "Score : $finalScore ",
                        style: new TextStyle(
                          fontSize: 22.0,
                        ),
                      )
                    ],
                  ),
                ),

                new Padding(padding: EdgeInsets.all(20.0)),

                //Question
                new Text(
                  quiz.question[questionNo],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //first button🍔

                    new MaterialButton(
                      onPressed: () {
                        if (quiz.options[questionNo][0] ==
                            quiz.answers[questionNo]) {
                          finalScore++;
                          debugPrint("Correct🎆🎆");
                        } else {
                          debugPrint("Incorrect🎭");
                        }
                        updateQuestion();
                      },
                      minWidth: 120.0,
                      color: Colors.cyan,
                      child: new Text(
                        quiz.options[questionNo][0],
                        style: new TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),

                    //second button. God Bless You if you are reading this code. 😁😁
                    new MaterialButton(
                      onPressed: () {
                        if (quiz.options[questionNo][1] ==
                            quiz.answers[questionNo]) {
                          finalScore++;
                          debugPrint("Correct🎆🎆");
                        } else {
                          debugPrint("Incorrect🎭");
                        }
                        updateQuestion();
                      },
                      minWidth: 120.0,
                      color: Colors.cyan,
                      child: new Text(
                        quiz.options[questionNo][1],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                //Second Row for Optionssssss
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //third button🍔

                    new MaterialButton(
                      onPressed: () {
                        if (quiz.options[questionNo][2] ==
                            quiz.answers[questionNo]) {
                          finalScore++;
                          debugPrint("Correct🎆🎆");
                        } else {
                          debugPrint("Incorrect🎭");
                        }
                        updateQuestion();
                      },
                      minWidth: 120.0,
                      color: Colors.cyan,
                      child: new Text(
                        quiz.options[questionNo][2],
                        style: new TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),

                    //fourth button. God Bless You if you are reading this code. 😁😁
                    new MaterialButton(
                      onPressed: () {
                        if (quiz.options[questionNo][3] ==
                            quiz.answers[questionNo]) {
                          finalScore++;
                          debugPrint("Correct🎆🎆");
                        } else {
                          debugPrint("Incorrect🎭");
                        }
                        updateQuestion();
                      },
                      minWidth: 120.0,
                      color: Colors.cyan,
                      child: new Text(
                        quiz.options[questionNo][3],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Container(
                  alignment: Alignment.bottomCenter,
                  child: new MaterialButton(
                    color: Colors.red,
                    minWidth: 240.0,
                    height: 40.0,
                    onPressed: resetQuiz,
                    child: new Text(
                      "Quit",
                      style: new TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNo = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      {
        if (questionNo == quiz.question.length - 1) {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new Summary(score: finalScore)));
        } else {
          questionNo++;
        }
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Final Score : $score",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                  questionNo = 0;
                  finalScore = 0;
                },
                child: new Text(
                  "Reset Quiz",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
