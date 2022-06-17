import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/health_points_and_calories_item.dart';

class HealthPointsAndCalories extends StatelessWidget {
  const HealthPointsAndCalories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        HealthPointsAndCaloriesItem(
          mainTitle: 'Health Points',
          number: 2000,
          iconData: Icons.shopping_bag,
          unit: 'Pts',
        ),
        SizedBox(width: 32.0),
        HealthPointsAndCaloriesItem(
          mainTitle: 'Calories',
          number: 200,
          iconData: Icons.bubble_chart_rounded,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
