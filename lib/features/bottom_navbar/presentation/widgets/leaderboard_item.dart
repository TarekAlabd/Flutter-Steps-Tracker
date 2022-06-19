import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/utilities/constants/assets.dart';

class LeaderboardItem extends StatelessWidget {
  final UserModel item;
  final int sNumber;

  const LeaderboardItem({
    Key? key,
    required this.item,
    required this.sNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              sNumber.toString(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                  ),
            ),
            Icon(
              CupertinoIcons.arrowtriangle_up_fill,
              color: Theme.of(context).primaryColorLight,
              size: 20,
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: CachedNetworkImageProvider(
                  AppAssets.dummyUserImage,
                ),
              ),
              const SizedBox(width: 12.0),
              Text(
                item.name,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Text(
                item.totalSteps.toString(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
