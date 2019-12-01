import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocabulary_app/models/vocab.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  // collection reference
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

  // vocab list form snapshot
  List<Vocab> _vocabListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
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
}
