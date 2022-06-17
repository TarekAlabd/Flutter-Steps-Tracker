import 'package:dartz/dartz.dart';
import 'package:flutter_steps_tracker/core/data/data_sources/database.dart';
import 'package:flutter_steps_tracker/core/data/error/exceptions/application_exception.dart';
import 'package:flutter_steps_tracker/core/data/error/failures/application_failure.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/mappers/exchange_history_to_model_mappers.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/entities/exchange_history_entity.dart';
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
      ExchangeHistoryEntity exchangeHistory) async {
    try {
      final user = await _authLocalDataSource.currentUser();
      await _database.setExchangeHistory(
        exchangeHistory.toModel(),
        user!.uid,
      );
      return const Right(true);
    } on ApplicationException catch (e) {
      return Left(
        firebaseExceptionsDecoder(e),
      );
    }
  }
}
