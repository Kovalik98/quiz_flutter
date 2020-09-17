import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_word/sembast/model.dart';
import 'file:///Users/nazarkovalik/AndroidStudioProjects/flutter_app_word/lib/quiz_page/appBar.dart';

import 'list_quiz.dart';




class QuizPage extends StatefulWidget {
  var _words;
  QuizPage(this._words);

  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Random random = new Random();
  int randomIndex = 0;
  var audit;
  void changeIndex() {
    setState(() => randomIndex = random.nextInt(4));
  }

  @override
  void initState() {
    super.initState();
    changeIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: new Text("Найти слово", textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),)),
        ),
        body: Column(
          children: <Widget>[
            Container(
                child: AppBarNadigationState(),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 40),
              color: Colors.white,
              height: 70,
              width: 400,
              child: Center(
              child: new Text(widget._words[randomIndex].name, style: TextStyle(
              fontSize: 30.0
              ),),
    ),
            ),
        Container(
              height: 400,
                child: GridView.count(
                crossAxisCount: 2 ,
                 children: List.generate(4,(index){
              return InkWell(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: audit,
                        ),
                        child: Image.network(widget._words[index].img, ),
                ),
                    ),
                    Container(
             child: Text(widget._words[index].name),
                  ),
                  ],
                ),
                onTap: () {
                  if (randomIndex == index){
                    print("true");
                   audit = Border.all(color: Colors.green, width: 2.0);
                    changeIndex();
                    (context as Element).reassemble();

                  }else if (randomIndex != index){
                    print("false");
                    audit = Border.all(color: Colors.red, width: 2.0);
                    (context as Element).reassemble();
                  } else {
                    return;
                  }
                },
              );
    }),
    )
    ),
  ],
    ),
    );
  }
}
