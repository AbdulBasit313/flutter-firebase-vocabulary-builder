import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocabulary_app/models/user.dart';
import 'package:vocabulary_app/models/vocab.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference vocabCollection =
      Firestore.instance.collection('vocabulary');

  Future updateUserData(String word, String partsOfSpeech, String meaning,
      String sentence) async {
    return await vocabCollection.document(uid).setData({
      'word': word,
      'partsOfSpeech': partsOfSpeech,
      'meaning': meaning,
      'sentence': sentence
    });
  }

  Future addUserInDatabase(String name) async {
    return await userCollection.document(uid).setData({
      'name': 'Ali'
      // 'email': email,
    });
  }

  Future<QuerySnapshot> getUserData() {
    return vocabCollection.getDocuments();
  }

  // vocab list form snapshot
  List<Vocab> _vocabListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      print('vocab === ${doc.data['word']}');
      return Vocab(
        word: doc.data['word'] ?? '',
        partsOfSpeech: doc.data['partsOfSpeech'] ?? '',
        meaning: doc.data['meaning'] ?? '',
        sentence: doc.data['sentence'] ?? '',
      );
    }).toList();
  }

  // get vocab stream
  Stream<List<Vocab>> get vocab {
    return vocabCollection.snapshots().map(_vocabListFromSnapshot);
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        word: snapshot.data['word'],
        partsOfSpeech: snapshot.data['partsOfSpeech'],
        meaning: snapshot.data['meaning'],
        sentence: snapshot.data['sentence']);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return vocabCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
