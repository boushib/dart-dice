import 'package:dice/constants/styles.dart';
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

  void _randomizeDice() {
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Let's play dice!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kGrey,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Image.asset(
                      'assets/images/dice-$leftDice.png',
                      width: 120,
                    ),
                    onTap: _randomizeDice,
                  ),
                  Container(
                    color: Colors.red,
                    width: 1.0,
                    height: 120.0,
                    margin: EdgeInsets.symmetric(horizontal: 24.0),
                  ),
                  InkWell(
                    child: Image.asset(
                      'assets/images/dice-$rightDice.png',
                      width: 120.0,
                    ),
                    onTap: _randomizeDice,
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Spacer(),
              Text(
                'SCORE',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    leftPlayerScore.toString(),
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
                    rightPlayerScore.toString(),
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
        ),
      ),
    );
  }
}
