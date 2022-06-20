import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/domain/use_cases/use_case.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/use_cases/earn_reward_use_case.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/use_cases/get_rewards_use_case.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/use_cases/get_user_data_use_case.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/rewards/rewards_state.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';
import 'package:injectable/injectable.dart';

@injectable
class RewardsCubit extends Cubit<RewardsState> {
  final GetRewardsUseCase _getRewardsUseCase;
  final GetUserDataUseCase _getUserDataUseCase;
  final EarnARewardUseCase _earnARewardUseCase;
  late Stream<List<RewardModel>> _rewardsStream;

  RewardsCubit(
    this._getRewardsUseCase,
    this._getUserDataUseCase,
    this._earnARewardUseCase,
  ) : super(
          const RewardsState.initial(),
        );

  Future<void> getUserPoints() async {
    emit(const RewardsState.loading());
    final result = await _getUserDataUseCase(NoParams());
    result.fold(
      (failure) => emit(
          RewardsState.userDataError(message: S.current.somethingWentWrong)),
      (user) => user.listen(
        (event) => emit(
          RewardsState.userDataLoaded(
            points: event.healthPoints,
          ),
        ),
      ),
    );
  }

  Future<void> earnAReward(RewardModel reward) async {
    emit(const RewardsState.earnLoading());
    final result = await _earnARewardUseCase(reward);
    emit(
      result.fold(
        (failure) {
          return RewardsState.earnError(message: S.current.somethingWentWrong);
        },
        (user) => const RewardsState.earnLoaded(),
      ),
    );
  }

  void getRewards() {
    emit(const RewardsState.loading());
    _rewardsStream = _getRewardsUseCase(NoParams());
    _rewardsStream.listen(onRewardsReceived).onError(onRewardsError);
  }

  void onRewardsReceived(List<RewardModel> rewards) {
    debugPrint('Rewards Length: ${rewards.length}');
    emit(RewardsState.loaded(rewards: rewards));
  }

  void onRewardsError(error) {
    debugPrint('onRewardsError: $error');
    emit(RewardsState.error(message: S.current.somethingWentWrong));
  }
}
