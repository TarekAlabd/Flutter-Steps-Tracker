import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rewards_state.freezed.dart';

@freezed
abstract class RewardsState with _$RewardsState {
  const factory RewardsState.initial() = Initial;

  const factory RewardsState.loading() = Loading;

  const factory RewardsState.loaded({required List<RewardModel> rewards}) =
      Loaded;

  const factory RewardsState.error({required String message}) = Error;
}
