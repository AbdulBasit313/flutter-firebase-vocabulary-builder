import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocabulary_app/models/vocab.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference booksCollection =
      Firestore.instance.collection('books');

  final databaseReference = Firestore.instance;

  Future addUserInDatabase(String name, String email) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
    });
  }

  // vocab list form snapshot
  List<Vocab> _vocabListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      print('doc =====> ${doc.documentID}');
      return Vocab(
        docId: doc.documentID ?? '',
        uid: doc.data['uid'] ?? '',
        word: doc.data['word'] ?? '',
        partsOfSpeech: doc.data['partsOfSpeech'] ?? '',
      );
    }).toList();
  }

  // get vocab stream
  Stream<List<Vocab>> vocab({String uid}) {
    return booksCollection
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map(_vocabListFromSnapshot);
  }

  // add data
  Future createRecord(String uid, String word, String partsOfSpeech) async {
    return await databaseReference.collection("books").add({
      'uid': uid,
      'word': word,
      'partsOfSpeech': partsOfSpeech,
    }).catchError((e) => print(e));
  }

  // delete data
  Future deleteRecord(docId) async {
    return await databaseReference
        .collection("books")
        .document(docId)
        .delete()
        .catchError((e) => print('error =====> $e'));
  }

  // updata data
  Future updateRecord(selectedDoc, newValues) async {
    return await databaseReference
        .collection("books")
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) => print('error =====> $e'));
  }
}

// final FirebaseAuth _auth = FirebaseAuth.instance;

// FirebaseUser user = await _auth.currentUser();

// Future<DocumentReference> getUserDoc() async {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final Firestore _firestore = Firestore.instance;

//   FirebaseUser user = await _auth.currentUser();
//   DocumentReference ref = _firestore.collection('users').document(user.uid);
//   // print('user email ${ref.}');
//   print('user uid ${user.uid}');
//   return ref;
// }

//  final CollectionReference vocabCollection =
// Firestore.instance.collection('vocabulary');

// // user data from snapshots
// UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//   return UserData(
//       uid: uid,
//       word: snapshot.data['word'],
//       partsOfSpeech: snapshot.data['partsOfSpeech'],
//       meaning: snapshot.data['meaning'],
//       sentence: snapshot.data['sentence']);
// }

// // get user doc stream
// Stream<UserData> get userData {
//   return vocabCollection.document(uid).snapshots().map(_userDataFromSnapshot);
// }

// Future updateUserData(String word, String partsOfSpeech, String meaning,
//     String sentence) async {
//   return await vocabCollection.document(uid).setData({
//     'word': word,
//     'partsOfSpeech': partsOfSpeech,
//     'meaning': meaning,
//     'sentence': sentence
//   });
// }

// Future<QuerySnapshot> getUserData() {
//   return vocabCollection.getDocuments();
// }

// getBooksCollection(String uid) {
//   return booksCollection.where('uid', isEqualTo: uid).getDocuments();
// }
