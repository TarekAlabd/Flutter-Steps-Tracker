import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardTopItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int sNumber;
  final int numberOfPoints;
  final bool first;

  const LeaderboardTopItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.sNumber,
    required this.numberOfPoints,
    this.first = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sNumber.toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 4.0),
        const Icon(
          CupertinoIcons.arrowtriangle_up_fill,
          color: Colors.blue,
        ),
        const SizedBox(height: 8.0),
        CircleAvatar(
          radius: first ? 75 : 65,
          child: CircleAvatar(
            radius: first ? 70 : 60,
            backgroundImage: CachedNetworkImageProvider(
              imageUrl,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          numberOfPoints.toString(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
