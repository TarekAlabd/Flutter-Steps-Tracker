import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home_cubit/home_state.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GetRadialGauge extends StatefulWidget {
  const GetRadialGauge({Key? key}) : super(key: key);

  @override
  State<GetRadialGauge> createState() => _GetRadialGaugeState();
}

class _GetRadialGaugeState extends State<GetRadialGauge> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = getIt<HomeCubit>();
    _homeCubit.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _homeCubit,
      listener: (context, state) {
        state.maybeWhen(
          feedbackGain: (steps) {
            final snackBar = SnackBar(
              content:
                  const Text('Congratulations! You gained more health points'),
              action: SnackBarAction(
                label: 'Cool!',
                onPressed: () => Navigator.of(context).pop(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => _buildRadialGauge(
            context,
            isLoading: true,
          ),
          loaded: (steps) => _buildRadialGauge(
            context,
            steps: steps,
          ),
          feedbackGain: (steps) => _buildRadialGauge(
            context,
            steps: steps,
          ),
          orElse: () => _buildRadialGauge(context),
        );
      },
    );
  }

  Widget _buildRadialGauge(
    BuildContext context, {
    bool isLoading = false,
    String steps = '0',
  }) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      title: GaugeTitle(
        text: 'Total Steps Today',
        textStyle: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.blue,
            ),
      ),
      axes: <RadialAxis>[
        RadialAxis(
          annotations: [
            GaugeAnnotation(
              widget: !isLoading
                  ? Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: '$steps\n',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Colors.blue,
                                  ),
                        ),
                        TextSpan(
                          text: 'Step Goal:\n',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        TextSpan(
                          text: '8000\n',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    )
                  : const CircularProgressIndicator(),
            ),
          ],
          pointers: <GaugePointer>[
            RangePointer(
              // TODO: Dummy equation for now until targeting each one's target
              // Our target is 8000 steps daily, do more sports!!!!
              value: ((double.tryParse(steps)!) / 8000) * 100,
              color: Colors.blue,
              dashArray: const <double>[8, 2],
            ),
          ],
        ),
      ],
    );
  }
}
