import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/rewards_item.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            Image.network(
              'https://www.socash.io/img/thumb-milestones.png',
              fit: BoxFit.cover,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Available Rewards',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.blue,
                  ),
            ),
            const SizedBox(height: 12.0),
            Column(
              children: List.generate(
                8,
                (index) => RewardsItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
