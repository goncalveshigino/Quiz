import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank = [

     Question.name("A nossa Angola tornou-se independente no ano de 1975", true),
     Question.name("O sengundo Presidente da Republica foi o Man Ze", true),
     Question.name("4 de Abril dia da paz", true),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A nossa Angola", style: TextStyle(color: Colors.blueGrey),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Builder(

          builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/ango.jpg",
                  width: 250,
                  height: 180,
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid
                    ) 
                  ),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(
                          fontSize: 16.6,
                          color: Colors.black
                        ),
                  ),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                   RaisedButton(onPressed: () => _prevQuestion(),
                  color: Colors.blueGrey.shade900,
                  child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),

                  RaisedButton(onPressed: () => _checkAnswer(true, context),
                  color: Colors.blueGrey.shade900,
                  child: Text("TRUE", style: TextStyle(color: Colors.white)),
                  ),

                   RaisedButton(onPressed: () => _checkAnswer(false, context),
                  color: Colors.blueGrey.shade900,
                  child: Text("FALSE", style: TextStyle(color: Colors.white),),
                  ),

                   RaisedButton(onPressed: () => _nextQuestion(),
                  color: Colors.blueGrey.shade900,
                  child: Icon(Icons.arrow_forward, color: Colors.white,),
                  ),

                ],
              ),
              
              Spacer(),


            ],
          ),
        ),
      ),
    );
  }

  _prevQuestion(){
     setState(() {
         _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
     });
  }


  _checkAnswer(bool userChoice, BuildContext context){

     if(userChoice == questionBank[_currentQuestionIndex].isCorrect) {

         final snackBar = SnackBar(

          duration: Duration(milliseconds: 500),
          content: Text('Correto!',

          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
            ),

           ),
           backgroundColor: Colors.green,
          );
         Scaffold.of(context).showSnackBar(snackBar,);

         _updateQuestion();

     } else {
        final snackBar = SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Incorreto!',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
          ),
         backgroundColor: Colors.redAccent,
        );
         Scaffold.of(context).showSnackBar(snackBar);

          _updateQuestion();
     }
  }

  _updateQuestion(){
     
     setState(() {
        _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
     });

  }

  _nextQuestion(){
     _updateQuestion();
  }
}
