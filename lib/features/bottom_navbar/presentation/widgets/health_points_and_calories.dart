import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home/home_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home/home_state.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/health_points_and_calories_item.dart';

class HealthPointsAndCalories extends StatefulWidget {
  const HealthPointsAndCalories({Key? key}) : super(key: key);

  @override
  State<HealthPointsAndCalories> createState() =>
      _HealthPointsAndCaloriesState();
}

class _HealthPointsAndCaloriesState extends State<HealthPointsAndCalories> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = getIt<HomeCubit>();
    _homeCubit.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _homeCubit,
      builder: (context, state) {
        return state.maybeWhen(
          stepsAndPointsLoading: () => _buildHealthRow(isLoading: true),
          stepsAndPointsLoaded: (steps, healthPoints) => _buildHealthRow(
            steps: steps,
            healthPoints: healthPoints,
          ),
          orElse: () => _buildHealthRow(),
        );
      },
    );
  }

  Widget _buildHealthRow({
    bool isLoading = false,
    int steps = 0,
    int healthPoints = 0,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: HealthPointsAndCaloriesItem(
            mainTitle: 'Health Points',
            number: isLoading ? '-' : healthPoints.toString(),
            iconData: Icons.shopping_bag,
            unit: 'Pts',
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: HealthPointsAndCaloriesItem(
            mainTitle: 'Total Steps',
            number: isLoading ? '-' : steps.toString(),
            iconData: Icons.bubble_chart_rounded,
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ],
    );
  }
}
