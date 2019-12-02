import 'package:flutter/material.dart';

class AddWord extends StatefulWidget {
  @override
  _AddWordState createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final _formKey = GlobalKey<FormState>();

  String word = '';
  String partsOfSpeech = '';
  String meaning = '';
  String sentence = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: Text('Add Word'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.filter),
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
            width: 300,
            height: 400,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Word',
                    ),
                    // validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => word = val);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Parts Of Speech',
                    ),
                    onChanged: (val) {
                      setState(() => partsOfSpeech = val);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Meaning',
                    ),
                    onChanged: (val) {
                      setState(() => meaning = val);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Sentence',
                    ),
                    onChanged: (val) {
                      setState(() => sentence = val);
                    },
                  ),
                  SizedBox(height: 100.0),
                  RaisedButton(
                      color: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text('SUBMIT'),
                      onPressed: () {}),
                  // SizedBox(height: 12.0),
                  // Text(
                  //   error,
                  //   style: TextStyle(color: Colors.red, fontSize: 14.0),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
