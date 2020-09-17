import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_word/quiz_page/quiz_page.dart';
import 'package:flutter_app_word/sembast/model.dart';
import 'package:get_it/get_it.dart';

import 'word_repository.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CakeRepository _cakeRepository = GetIt.I.get();
  List<Word> _words = [];

  @override
  void initState() {
    super.initState();
    _loadCakes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: new Text("Словарь", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),)),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 550,
            child: ListView.builder(
              itemCount: _words.length,
              itemBuilder: (context, index) {
                final cake = _words[index];
                return Card(
                  child: Container(
                    height: 120,
                    child: Center(
                      child: ListTile(
                        leading: Container(
                            child: Image.network(cake.img)),
                        title: Text(cake.name),
                        subtitle: Text(cake.subtext),
                        trailing: IconButton(
                          icon: Icon(Icons.volume_up,
                            color: Colors.indigo,),
                          onPressed: () => _deleteCake(cake),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Container(
              height: 50,
              width: 250,
              child: Padding(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.indigo,
                  child: Text("Начать урок"),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addCake,
      ),
    );
  }

  _loadCakes() async {
    final words = await _cakeRepository.getAllCakes();
    setState(() => _words = words);
  }

  _addCake() async {
    List wonders = [
      Word(
          img:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
          name: "Taj Mahal",
          subtext: "India"),
      Word(
          img:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Christ-the-Redeemer.jpg",
          name: "Christ the Redeemer",
          subtext: "Brazil"),
      Word(
          img:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2016/03/petra-jordan9.jpg",
          name: "Petra",
          subtext: "Jordan"),
      Word(
          img:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Great-Wall-of-China-view.jpg",
          name: "The Great Wall of China",
          subtext: "China"),
      Word(
          img:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/View-of-the-Colosseum.jpg",
          name: "The Colosseum",
          subtext: "Rome"),
      Word(
          img:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Machu-Picchu-around-sunset.jpg",
          name: "Machu Picchu",
          subtext: "Peru"),
      Word(
          img:
          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Chichen-Itza-at-night.jpg",
          name: "Chichén Itzá",
          subtext: "Mexico"),
    ];

    for (var i = 0; i < wonders.length; i++) {
      final newCake = Word(name: wonders[i].name,
        img: wonders[i].img,
        subtext: wonders[i].subtext,);
      await _cakeRepository.insertCake(newCake);
      _loadCakes();
    }
  }

  _deleteCake(Word cake) async {
    await _cakeRepository.deleteCake(cake.id);
    _loadCakes();
  }

  Route _createRoute() {

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => QuizPage(_words),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );

  }
}