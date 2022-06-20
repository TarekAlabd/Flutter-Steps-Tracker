import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home/home_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/ad_area.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/get_radial_gauge.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/health_points_and_calories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        final cubit = getIt<HomeCubit>();
        cubit.getUserData();
        return cubit;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: HealthPointsAndCalories(),
              ),
              SizedBox(height: 24.0),
              GetRadialGauge(),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: AdArea(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
