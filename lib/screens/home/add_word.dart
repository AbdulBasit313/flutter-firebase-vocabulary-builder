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
            // height: 400,
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
                    // validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
                    onChanged: (val) {
                      setState(() => meaning = val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 45.0, horizontal: 10.0),
                      hintText: 'Sentence',
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => sentence = val);
                    },
                  ),
                  SizedBox(height: 100.0),
                  RaisedButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 90.0),
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
