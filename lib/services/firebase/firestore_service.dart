import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Generic method to get a document
  Future<DocumentSnapshot> getDocument(String collection, String id) {
    return _db.collection(collection).doc(id).get();
  }

  // Generic method to set a document
  Future<void> setDocument(String collection, String id, Map<String, dynamic> data) {
    return _db.collection(collection).doc(id).set(data, SetOptions(merge: true));
  }

  // Generic method to add a document
  Future<DocumentReference> addDocument(String collection, Map<String, dynamic> data) {
    return _db.collection(collection).add(data);
  }

  // Generic stream for a collection
  Stream<QuerySnapshot> getCollectionStream(String collection) {
    return _db.collection(collection).snapshots();
  }

  // User specific methods
  Future<void> saveUserData(String uid, Map<String, dynamic> data) {
    return setDocument('users', uid, data);
  }

  Stream<DocumentSnapshot> getUserStream(String uid) {
    return _db.collection('users').doc(uid).snapshots();
  }
}
