import 'package:dartz/dartz.dart';
import 'package:flutter_steps_tracker/core/data/data_sources/database.dart';
import 'package:flutter_steps_tracker/core/data/error/exceptions/application_exception.dart';
import 'package:flutter_steps_tracker/core/data/error/failures/application_failure.dart';
import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/exchange_history_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/repositories/bottom_navbar_repository.dart';
import 'package:flutter_steps_tracker/features/intro/data/data_sources/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: BottomNavbarRepository)
class BottomNavbarRepositoryImpl implements BottomNavbarRepository {
  final Database _database;
  final AuthLocalDataSource _authLocalDataSource;

  BottomNavbarRepositoryImpl(
    this._database,
    this._authLocalDataSource,
  );

  @override
  Stream<List<RewardModel>> rewardsStream() {
    return _database.rewardsStream();
  }

  @override
  Future<Either<Failure, bool>> setExchangeHistory(
      ExchangeHistoryModel exchangeHistory) async {
    try {
      final user = await _authLocalDataSource.currentUser();
      await _database.setExchangeHistory(
        exchangeHistory,
        user!.uid,
      );
      return const Right(true);
    } on ApplicationException catch (e) {
      return Left(
        firebaseExceptionsDecoder(e),
      );
    }
  }

  @override
  Future<Either<Failure, Stream<List<ExchangeHistoryModel>>>>
      exchangesHistoryStream() async {
    try {
      final user = await _authLocalDataSource.currentUser();
      return Right(_database.exchangeHistoryStream(user!.uid));
    } on ApplicationException catch (e) {
      return Left(
        firebaseExceptionsDecoder(e),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setStepsAndPoints(int steps) async {
    try {
      final user = await _authLocalDataSource.currentUser();
      var totalSteps = user!.totalSteps + steps;
      int healthPoints = ((totalSteps / 100) * 5) as int;
      final newUser = UserModel(
        uid: user.uid,
        name: user.name,
        totalSteps: totalSteps,
        healthPoints: healthPoints,
      );
      await _database.setUserData(newUser);
      await _authLocalDataSource.persistAuth(newUser);
      return const Right(true);
    } on ApplicationException catch (e) {
      return Left(
        firebaseExceptionsDecoder(e),
      );
    }
  }
}
