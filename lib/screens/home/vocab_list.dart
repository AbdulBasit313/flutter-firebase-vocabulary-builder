import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vocabulary_app/models/vocab.dart';

class VocabList extends StatefulWidget {
  @override
  _VocabListState createState() => _VocabListState();
}

class _VocabListState extends State<VocabList> {
  @override
  Widget build(BuildContext context) {
    // final vocabs = Provider.of<List<Vocab>>(context);

    // vocabs.forEach((vocab) {
    //   print('word === ${vocab.word}');
    //   print('partsOfSpeech === ${vocab.partsOfSpeech}');
    //   print('meaning === ${vocab.meaning}');
    //   print('sentence === ${vocab.sentence}');
    // });

    return Container(
      child: Text(
        'list of words',
      ),
    );
  }
}
