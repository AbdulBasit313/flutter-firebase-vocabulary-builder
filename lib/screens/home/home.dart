import 'package:provider/provider.dart';
// import 'package:vocabulary_app/models/user.dart';
import 'package:vocabulary_app/models/vocab.dart';
import 'package:vocabulary_app/screens/home/add_word.dart';
import 'package:vocabulary_app/screens/home/vocab_list.dart';
import 'package:vocabulary_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_app/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);
    return StreamProvider<List<Vocab>>.value(
      value: DatabaseService().vocab,
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: Text('Vocaby'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddWord(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        body: VocabList(),
      ),
    );
  }
}
