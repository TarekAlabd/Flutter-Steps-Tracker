import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/core/data/services/firestore_services.dart';
import 'package:flutter_steps_tracker/utilities/constants/api_path.dart';
import 'package:injectable/injectable.dart';

abstract class Database {
  Future<void> setUserData(UserModel user);
}

String documentIdFromLocalGenerator() => DateTime.now().toIso8601String();

@Singleton(as: Database)
class FireStoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  Future<void> setUserData(UserModel user) async {
    await _service.setData(
      path: APIPath.user(user.uid),
      data: user.toMap(),
    );
  }

  // @override
  // Future<void> deleteRequest(Request request) async {
  //   await _service.deleteData(path: APIPath.request(request.id));
  // }

  // @override
  // Stream<List<ُExample>> examplesStream() => _service.collectionStream(
  //       path: APIPath.examples(),
  //       builder: (data, documentId) => Example.fromMap(data, documentId),
  //     );
}
