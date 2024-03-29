class User {
  final String uid;
  final String name;
  final String email;

  User({this.uid, this.name, this.email});
  // User({this.uid});
}

class UserData {
  final String uid;
  final String word;
  final String partsOfSpeech;
  final String meaning;
  final String sentence;

  UserData(
      {this.uid, this.word, this.partsOfSpeech, this.meaning, this.sentence});
}
