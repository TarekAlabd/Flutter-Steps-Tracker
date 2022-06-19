import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int sNumber;
  final int numberOfPoints;

  const LeaderboardItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.sNumber,
    required this.numberOfPoints,
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
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Icon(
              CupertinoIcons.arrowtriangle_up_fill,
              color: Colors.blue,
              size: 20,
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: CachedNetworkImageProvider(
                  imageUrl,
                ),
              ),
              const SizedBox(width: 12.0),
              Text(
                name,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Text(
                numberOfPoints.toString(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.blue,
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
