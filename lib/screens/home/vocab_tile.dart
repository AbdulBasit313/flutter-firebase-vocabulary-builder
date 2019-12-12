import 'package:flutter/material.dart';
import 'package:vocabulary_app/models/vocab.dart';

class VocabTile extends StatelessWidget {
  final Vocab vocab;
  VocabTile({this.vocab});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            title: Text(vocab.word),
            subtitle: Text(vocab.partsOfSpeech),
          ),
        ));
  }
}
