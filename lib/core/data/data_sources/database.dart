import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/core/data/services/firestore_services.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/exchange_history_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/utilities/constants/api_path.dart';
import 'package:injectable/injectable.dart';

abstract class Database {
  Future<void> setUserData(UserModel user);

  Future<void> setExchangeHistory(
    ExchangeHistoryModel history,
    String uid,
  );

  Stream<List<RewardModel>> rewardsStream();
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

  @override
  Future<void> setExchangeHistory(
    ExchangeHistoryModel history,
    String uid,
  ) async {
    await _service.setData(
      path: APIPath.exchangeHistory(uid, history.id),
      data: history.toMap(),
    );
  }

  @override
  Stream<List<RewardModel>> rewardsStream() => _service.collectionStream(
        path: APIPath.rewards(),
        builder: (data, documentId) => RewardModel.fromMap(data, documentId),
      );
}
