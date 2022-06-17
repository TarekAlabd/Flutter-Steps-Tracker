import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  Stream<List<T>> collectionStream<T>(
      {required String path,
      required T Function(Map<String, dynamic> data, String documentId) builder,
      Query Function(Query query)? queryBuilder,
      int Function(T lhs, T rhs)? sort}) {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) query = queryBuilder(query);
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(snapshot.data() as Map<String, dynamic>, snapshot.id),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) result.sort(sort);

      return result;
    });
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    debugPrint('delete: $path');
    await reference.delete();
  }

  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    debugPrint('$path:$data');
    await reference.set(data);
  }

  Stream<T> documentStream<T>(
      {required String path,
      required T Function(Map<String, dynamic> data, String documentId) builder}) {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => builder(snapshot.data() as Map<String, dynamic>, snapshot.id));
  }
}
