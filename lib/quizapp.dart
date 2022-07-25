// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quizzler_app/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizapp extends StatefulWidget {
  const Quizapp({Key? key}) : super(key: key);

  @override
  State<Quizapp> createState() => _QuizappState();
}

// ignore: duplicate_ignore
class _QuizappState extends State<Quizapp> {
  List<Widget> Scorekeeper = [];

  List<Question> Questionbank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was Moon.', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called Backrub.', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  int questionnumber = 0;

  void Questionnumber() {
    if (questionnumber < Questionbank.length - 1) {
      questionnumber++;
    }
  }

  void Iconadd(bool correctanswer) {
    if (correctanswer == Questionbank[questionnumber].questionanswer) {
      // ignore: avoid_print
      Scorekeeper.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      // ignore: avoid_print
      Scorekeeper.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  void scoretracker(bool correctanswer) {
    if (questionnumber < Questionbank.length - 1) {
      Iconadd(correctanswer);
    } else {
      Alert(
        style: AlertStyle(
            animationType: AnimationType.fromRight,
            animationDuration: const Duration(milliseconds: 800),
            backgroundColor: Colors.grey[850],
            titleStyle: const TextStyle(color: Color.fromARGB(255, 0, 95, 3)),
            descStyle: const TextStyle(color: Colors.white)),
        context: context,
        type: AlertType.success,
        title: "Quizzler",
        desc: "Quiz is Over\n CONGRATULATIONS!",
        buttons: [
          DialogButton(
            color: Colors.green[400],
            // ignore: sort_child_properties_last
            child: const Text(
              "RESTART",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.popAndPushNamed(context, "/quizapp"),
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 66, 66),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Quizzler"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  Questionbank[questionnumber].questiontext,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                      color: Colors.green,
                      child: const Text(
                        "True",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        bool correctanswer = true;
                        scoretracker(correctanswer);
                        setState(() {
                          Questionnumber();
                        });
                      }))),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
                color: Colors.green,
                child: const Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  bool correctanswer = false;
                  scoretracker(correctanswer);
                  setState(() {
                    Questionnumber();
                  });
                }),
          )),
          Row(children: [...Scorekeeper])
        ],
      ),
    );
  }
}
