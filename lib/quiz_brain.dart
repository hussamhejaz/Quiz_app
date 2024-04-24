import 'question.dart';
class QuizBrain {
   int _questionNumber = 0;
  final List<Question> _questionBank=[
    Question(questionText:'are you happy',questionAnswer:true),
    Question(questionText:'are you sad',questionAnswer:true),
    Question(questionText:'are you hungry ',questionAnswer:false),
    Question(questionText:'are you happy',questionAnswer:true),
    Question(questionText:'are you angry',questionAnswer:false),
    Question(questionText:'are you exited ',questionAnswer:false),



  ];

   void nextQuestion(){
    if (_questionNumber < _questionBank.length-1){
      _questionNumber++;
      print(_questionBank.length);

    }
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;

  }
  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished(){
     if(_questionNumber >= _questionBank.length-1){
       return true;

     }
     else {
       return false;
     }

  }
   void reset() {
     _questionNumber = 0;
   }


}