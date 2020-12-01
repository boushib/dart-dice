import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  static const route = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDice = 2;
  int rightDice = 1;

  int leftPlayerScore = 0;
  int rightPlayerScore = 0;

  void randomizeDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;

      if (leftDice == rightDice) return;

      leftDice > rightDice ? leftPlayerScore++ : rightPlayerScore++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Let's play dice!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff666666)),
            ),
            padding: EdgeInsets.all(16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Image.asset(
                  'assets/images/dice-$leftDice.png',
                  width: 120,
                ),
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  randomizeDice();
                },
              ),
              FlatButton(
                child: Image.asset(
                  'assets/images/dice-$rightDice.png',
                  width: 120.0,
                ),
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  randomizeDice();
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              "Score:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$leftPlayerScore",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    ":",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Text(
                "$rightPlayerScore",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
