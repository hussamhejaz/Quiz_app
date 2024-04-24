import 'quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzeler());
}

class Quizzeler extends StatelessWidget {
  const Quizzeler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> score=[];
  void check(bool pickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {

      if ( quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        score=[];
      }
      else {
        if (pickedAnswer == correctAnswer) {
          score.add(const Icon(Icons.check, color: Colors.green,));
        }
        else {
          score.add(const Icon(Icons.close, color: Colors.red,));
        }

        quizBrain.nextQuestion();
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  setState(() {

                    check(true);
                  });
                },
                child: const Text(
                  'True',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  setState(() {
                   check(false);
                  });
                },
                child: const Text(
                  'False',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
            ),
          ),
        ),

          Row(
          children:score,
        )
      ],
    );
  }
}
