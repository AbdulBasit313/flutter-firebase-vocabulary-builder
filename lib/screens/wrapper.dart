import 'package:vocabulary_app/models/user.dart';
import 'package:vocabulary_app/screens/authenticate/authenticate.dart';
import 'package:vocabulary_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print('user ====> ${user.email}');
    // print('user ====> ${user.uid}');
    // return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
