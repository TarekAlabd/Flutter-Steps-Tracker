import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/presentation/widgets/show_alert_dialog.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/reward_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/rewards/rewards_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/rewards/rewards_state.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';

class RewardsItem extends StatefulWidget {
  final RewardModel reward;

  const RewardsItem({
    Key? key,
    required this.reward,
  }) : super(key: key);

  @override
  State<RewardsItem> createState() => _RewardsItemState();
}

class _RewardsItemState extends State<RewardsItem> {
  late RewardsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<RewardsCubit>();
    _cubit.getUserPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.reward.imageUrl,
                  fit: BoxFit.cover,
                  height: 80,
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.reward.name,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4.0),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: widget.reward.description,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            TextSpan(
                              text: ' ${widget.reward.points} Points!',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      BlocBuilder<RewardsCubit, RewardsState>(
                        bloc: _cubit,
                        buildWhen: (prev, current) =>
                            current is UserDataLoading ||
                            current is UserDataLoaded,
                        builder: (context, state) {
                          return state.maybeWhen(
                            userDataLoading: () => _buildEarnButton(
                              context,
                              isLoading: true,
                            ),
                            userDataLoaded: (points) => _buildEarnButton(
                              context,
                              points: points,
                            ),
                            orElse: () => _buildEarnButton(context),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // TODO: Refactor this to make it a separate widget for all the buttons
  Widget _buildEarnButton(
    BuildContext context, {
    bool isLoading = false,
    int points = 0,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: !isLoading
            ? () {
                if (widget.reward.points <= points) {
                  showAlertDialog(
                    context,
                    title: S.current.qrCode,
                    contentWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: widget.reward.qrCode,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            S.current.scanQrCode,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    defaultActionText: S.current.dummyDone,
                    cubit: _cubit,
                    defaultAction: () async {
                      await _cubit.earnAReward(widget.reward);
                    },
                  );
                } else {
                  showAlertDialog(
                    context,
                    title: S.current.notice,
                    content: S.current.pointsLessThanItem,
                    defaultActionText: S.current.done,
                  );
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: !isLoading
            ? Text(
                S.current.earn,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
