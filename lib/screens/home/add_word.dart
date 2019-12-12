import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_app/services/database.dart';

class AddWord extends StatefulWidget {
  @override
  _AddWordState createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final _formKey = GlobalKey<FormState>();

  final DatabaseService _addData = DatabaseService();

  final databaseReference = Firestore.instance;

  String uid = '';
  String word = '';
  String partsOfSpeech = '';
  String meaning = '';
  String sentence = '';
  String error = '';
  String myText = '';

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) {
      print('uid ===== ${user.uid}');
      uid = user.uid;
    });

    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: Text('Add Word'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.filter_list),
            label: Text('filter'),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: Colors.blue[300],
            ),
            width: 340,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Word',
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (val) => val.isEmpty ? 'word' : null,
                    onChanged: (val) {
                      setState(() => word = val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Parts Of Speech',
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (val) => val.isEmpty ? 'partsOfSpeech' : null,
                    onChanged: (val) {
                      setState(() => partsOfSpeech = val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Meaning',
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (val) => val.isEmpty ? 'meaning' : null,
                    onChanged: (val) {
                      setState(() => meaning = val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 70.0, horizontal: 10.0),
                      hintText: 'Sentence',
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (val) => val.isEmpty ? 'sentence' : null,
                    onChanged: (val) {
                      setState(() => sentence = val);
                    },
                  ),
                  SizedBox(height: 70.0),
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text('SUBMIT'),
                    onPressed: () =>
                        _addData.createRecord(uid, word, partsOfSpeech),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    myText,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// void add() {
//   Map<String, String> data = <String, String>{
//     'word': word,
//     'partsOfSpeech': partsOfSpeech,
//     'meaning': meaning,
//     'sentence': sentence
//   };
//   documentReference.add(data).whenComplete(() {
//     print('document added');
//   }).catchError((e) => print(e));
// }

// void createRecord() async {
//   DocumentReference ref = await databaseReference.collection("books").add({
//     // 'id': id,
//     'word': word,
//     'partsOfSpeech': partsOfSpeech,
//   });
//   print(ref.documentID);
// }

// void getData() {
//   databaseReference
//       .collection("books")
//       .getDocuments()
//       .then((QuerySnapshot snapshot) {
//     snapshot.documents.forEach((f) => print('${f.data}}'));
//   });
// }
