import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/leaderboard/leaderboard_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/leaderboard/leaderboard_state.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/leaderboard_item.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/leaderboard_top_item.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeaderboardCubit>(
      create: (context) {
        final cubit = getIt<LeaderboardCubit>();
        cubit.getUsers();
        return cubit;
      },
      child: Builder(builder: (context) {
        return SafeArea(
          child: BlocBuilder<LeaderboardCubit, LeaderboardState>(
            bloc: BlocProvider.of<LeaderboardCubit>(context),
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => _buildLeaderboardPage(context, isLoading: true),
                loaded: (users) => _buildLeaderboardPage(context, users: users),
                orElse: () => _buildLeaderboardPage(context),
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildLeaderboardPage(BuildContext context,
      {bool isLoading = false, List<UserModel>? users}) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (users == null || users.isEmpty) {
      return Center(
        child: Text(S.of(context).emptyState),
      );
    }

    /// TODO: we will refactor this part in the future
    List<UserModel> leftUsers = users.length > 3 ? users.sublist(3) : [];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (users.length >= 2)
                        LeaderboardTopItem(
                          sNumber: 2,
                          item: users[1],
                        ),
                      if (users.length >= 3)
                        LeaderboardTopItem(
                          sNumber: 3,
                          item: users[2],
                        ),
                    ],
                  ),
                ),
                LeaderboardTopItem(
                  sNumber: 1,
                  first: true,
                  item: users[0],
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            const Divider(),
            Column(
              children: List.generate(leftUsers.length, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: LeaderboardItem(
                        sNumber: index + 4,
                        item: leftUsers[index],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
