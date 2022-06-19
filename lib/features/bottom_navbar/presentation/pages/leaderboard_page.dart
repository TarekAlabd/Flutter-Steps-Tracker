import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/leaderboard_item.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/leaderboard_top_item.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                        LeaderboardTopItem(
                          name: 'Tarek Alabd',
                          imageUrl:
                              'https://pbs.twimg.com/profile_images/1493704582505144323/Stvh3FSK_400x400.jpg',
                          sNumber: 2,
                          numberOfPoints: 2600,
                        ),
                        LeaderboardTopItem(
                          name: 'Tarek Alabd',
                          imageUrl:
                              'https://pbs.twimg.com/profile_images/1493704582505144323/Stvh3FSK_400x400.jpg',
                          sNumber: 3,
                          numberOfPoints: 2600,
                        ),
                      ],
                    ),
                  ),
                  LeaderboardTopItem(
                    name: 'Tarek Alabd',
                    imageUrl:
                        'https://pbs.twimg.com/profile_images/1493704582505144323/Stvh3FSK_400x400.jpg',
                    sNumber: 1,
                    numberOfPoints: 2600,
                    first: true,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Divider(),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  LeaderboardItem(
                      name: 'Tarek Alabd',
                      imageUrl:
                          'https://pbs.twimg.com/profile_images/1493704582505144323/Stvh3FSK_400x400.jpg',
                      sNumber: 4,
                      numberOfPoints: 1900),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
