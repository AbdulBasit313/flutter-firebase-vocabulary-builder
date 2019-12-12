import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabulary_app/models/vocab.dart';
import 'package:vocabulary_app/screens/home/vocab_tile.dart';

class VocabList extends StatefulWidget {
  @override
  _VocabListState createState() => _VocabListState();
}

class _VocabListState extends State<VocabList> {
  @override
  Widget build(BuildContext context) {
    final vocabs = Provider.of<List<Vocab>>(context);

    print('vocabs length ======= ${vocabs.length}');

    return ListView.builder(
        itemCount: vocabs.length,
        itemBuilder: (context, index) {
          return VocabTile(vocab: vocabs[index]);
        });
  }
}

// bool items = false;
// var books;

// @override
// void initState() {
//   super.initState();

//   DatabaseService()
//       .getBooksCollection('fM6XGhyufwQen7cONkmYQ9gAGYE3')
//       .then((QuerySnapshot docs) {
//     if (docs.documents.isNotEmpty) {
//       items = true;
//       books = docs.documents[0].data;
//     }
//   });
// }

// vocabs.forEach((vocab) {
//   print('word === ${vocab.word}');
//   print('partsOfSpeech === ${vocab.partsOfSpeech}');
//   print('meaning === ${vocab.meaning}');
//   print('sentence === ${vocab.sentence}');
// });
