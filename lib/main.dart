import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final noun = new WordNoun.random();
    return new MaterialApp(
      title: 'Word Game',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Word Game'),
        ),
        body: new Center(
          child: new Text(
              'Noun: ${noun.asCapitalized}'),
        ),
      ),
    );
  }
}

