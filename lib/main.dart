import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

//Use the dart components library to obtain various functionality
//Random words package provide word randomization

void main() => runApp(new MyApp());

//All classes implemented here are widgets
//Widgets allwo us to make the UI modular
//We can break them down into various contituents
//The MyApp widget is stateless meaning it doesnt change during app runtime

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Word Game',
      home: new RandomSentences(),
    );
  }
}

//This creates a new Stateful widget
//Stateful widgets allow us to change content while preserving state
//They are essentially mutable

class RandomSentences extends StatefulWidget {
  @override
  createState() => new RandomSentencesState();
}


//RandomSentenceState allows us to make changes to the content in the RandomSentences
//stateful widget
class RandomSentencesState extends State<RandomSentences> {

  final _sentences = <String>[];
  final _biggerFont = const TextStyle(fontSize: 14.0); //Provide styling as predefined contexts

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Word Game'),
      ),
      body: _buildSentences(),
    );
  }

  //Simple function that obtains random words
  //And calls them into a sentence structure

  String _getSentence() {
    final noun = new WordNoun.random();
    final adjective = new WordAdjective.random();

    return "The programmer built a ${adjective.asCapitalized}"
        " app and showed it to ${noun.asCapitalized}";
  }

  Widget _buildRow (String sentence) {
    return new ListTile(
      title: new Text(
        sentence,
        style: _biggerFont,
      ),
    );
  }

  //Building sentences and the indexes ensuring we have a scrollable list

  Widget _buildSentences() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          //if the index is odd, create a new divider
          //Prevents having dividers at the top and bottom of the listview

          final index = i ~/ 2;

          if (index >= _sentences.length) {

            for (int x = 0; x < 10; x++){
              _sentences.add(_getSentence());
            }

          }

          return _buildRow(_sentences[index]);
        }
    );
  }
}

