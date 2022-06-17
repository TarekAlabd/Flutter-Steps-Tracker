import 'package:flutter_steps_tracker/core/data/data_sources/database.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/repositories/bottom_navbar_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: BottomNavbarRepository)
class BottomNavbarRepositoryImpl implements BottomNavbarRepository {
  final Database _database;

  BottomNavbarRepositoryImpl(this._database);

  @override
  Stream<List<RewardModel>> rewardsStream() {
    return _database.rewardsStream();
  }
}
