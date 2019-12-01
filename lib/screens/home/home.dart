import 'package:provider/provider.dart';
// import 'package:vocabulary_app/models/user.dart';
import 'package:vocabulary_app/models/vocab.dart';
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
        body: VocabList(),
        // body: Container(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       'Hello ${user.email} welcom to app!',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 22.0,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
