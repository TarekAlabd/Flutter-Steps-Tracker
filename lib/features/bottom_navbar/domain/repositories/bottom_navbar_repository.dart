import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';

abstract class BottomNavbarRepository {
  Stream<List<RewardModel>> rewardsStream();
}
