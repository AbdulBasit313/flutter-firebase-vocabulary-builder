import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vocabulary_app/models/vocab.dart';
import 'package:vocabulary_app/services/database.dart';

import 'add_word.dart';

class VocabTile extends StatelessWidget {
  final DatabaseService _deleteData = DatabaseService();
  final Vocab vocab;
  VocabTile({this.vocab});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      // actionExtentRatio: 0.25,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[300],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        // color: Colors.transparent,
        child: ListTile(
          title: Text(vocab.word),
          subtitle: Text(vocab.partsOfSpeech),
        ),
      ),
      secondaryActions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: IconSlideAction(
            caption: 'Edit',
            color: Colors.green[400],
            icon: Icons.mode_edit,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddWord(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _deleteData.deleteRecord(vocab.docId),
          ),
        ),
      ],
    );
  }
}
