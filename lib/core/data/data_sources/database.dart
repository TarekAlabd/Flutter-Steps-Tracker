import 'package:flutter_steps_tracker/core/data/models/steps_and_points_model.dart';
import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/core/data/services/firestore_services.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/exchange_history_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/utilities/constants/api_path.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

abstract class Database {
  Future<void> setUserData(UserModel user);

  Future<void> setExchangeHistory(
    ExchangeHistoryModel history,
    String uid,
  );

  Future<void> setDailySteps(
    StepsAndPointsModel stepsAndPoints,
    String uid,
  );

  Stream<List<RewardModel>> rewardsStream();

  Stream<List<StepsAndPointsModel>> dailyPointsStream(
    String uid,
    String currentId,
  );

  Stream<List<ExchangeHistoryModel>> exchangeHistoryStream(String uid);
}

String documentIdFromLocalGenerator() => DateTime.now().toIso8601String();

String documentIdForDailyUse() => DateFormat.yMMMMd().format(DateTime.now());

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

  @override
  Stream<List<ExchangeHistoryModel>> exchangeHistoryStream(String uid) =>
      _service.collectionStream(
        path: APIPath.exchangesHistory(uid),
        builder: (data, documentId) =>
            ExchangeHistoryModel.fromMap(data, documentId),
      );

  @override
  Stream<List<StepsAndPointsModel>> dailyPointsStream(
    String uid,
    String currentId,
  ) =>
      _service.collectionStream(
        path: APIPath.dailyStepsAndPointsStream(uid),
        builder: (data, documentId) =>
            StepsAndPointsModel.fromMap(data, documentId),
        queryBuilder: (query) => query.where(
          'id',
          isNotEqualTo: currentId,
        ),
      );

  @override
  Future<void> setDailySteps(
          StepsAndPointsModel stepsAndPoints, String uid) async =>
      _service.setData(
        path: APIPath.setDailyStepsAndPoints(uid, stepsAndPoints.id),
        data: stepsAndPoints.toMap(),
      );
}
