import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/rewards/rewards_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/rewards/rewards_state.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/rewards_item.dart';
import 'package:flutter_steps_tracker/utilities/constants/assets.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RewardsCubit>(
      create: (context) {
        final cubit = getIt<RewardsCubit>();
        cubit.getRewards();
        cubit.getUserPoints();
        return cubit;
      },
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.rewardsBanner,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Available Rewards',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                const SizedBox(height: 12.0),
                BlocBuilder<RewardsCubit, RewardsState>(
                  bloc: BlocProvider.of<RewardsCubit>(context),
                  builder: (context, state) {
                    return state.maybeWhen(
                      loaded: (rewards) => _buildList(rewards: rewards),
                      loading: () => _buildList(isLoading: true),
                      orElse: () => _buildList(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildList({bool isLoading = false, List<RewardModel>? rewards}) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return rewards != null && rewards.isNotEmpty
        ? Column(
            children: rewards
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: RewardsItem(reward: e),
                  ),
                )
                .toList(),
          )
        : const Center(
            child: Text('No Data Available!'),
          );
  }
}
