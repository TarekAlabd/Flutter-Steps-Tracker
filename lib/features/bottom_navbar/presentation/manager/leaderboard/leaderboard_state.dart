import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/entities/leaderboard_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_state.freezed.dart';

@freezed
abstract class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState.initial() = Initial;

  const factory LeaderboardState.loading() = Loading;

  const factory LeaderboardState.loaded({required List<UserModel> users}) =
      Loaded;

  const factory LeaderboardState.error({required String message}) = Error;
}
