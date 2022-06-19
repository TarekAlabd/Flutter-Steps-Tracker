import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/utilities/constants/assets.dart';

class LeaderboardTopItem extends StatelessWidget {
  final UserModel item;
  final int sNumber;
  final bool first;

  const LeaderboardTopItem({
    Key? key,
    required this.item,
    required this.sNumber,
    this.first = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sNumber.toString(),
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
        const SizedBox(height: 4.0),
        Icon(
          CupertinoIcons.arrowtriangle_up_fill,
          color: Theme.of(context).primaryColorLight,
        ),
        const SizedBox(height: 8.0),
        CircleAvatar(
          radius: first ? 75 : 65,
          backgroundColor: Theme.of(context).primaryColorLight,
          child: CircleAvatar(
            radius: first ? 70 : 60,
            backgroundImage: const CachedNetworkImageProvider(
              AppAssets.dummyUserImage,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          item.name,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          item.totalSteps.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
