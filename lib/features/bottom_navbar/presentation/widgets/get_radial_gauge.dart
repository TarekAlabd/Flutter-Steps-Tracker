import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home/home_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home/home_state.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';
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
              content: Text(S.of(context).gainMorePoints),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
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
    String steps = '0',
  }) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      title: GaugeTitle(
        text: S.of(context).totalStepsToday,
        textStyle: Theme.of(context).textTheme.headline5!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
      axes: <RadialAxis>[
        RadialAxis(
          axisLineStyle: AxisLineStyle(
            color: Theme.of(context).primaryColorDark,
            dashArray: const <double>[8, 2],
          ),
          axisLabelStyle: GaugeTextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
          annotations: [
            GaugeAnnotation(
              widget: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '$steps\n',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  TextSpan(
                    text: '${S.of(context).stepGoal}\n',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  TextSpan(
                    text: '8000\n',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          pointers: <GaugePointer>[
            RangePointer(
              // TODO: Dummy equation for now until targeting each one's target
              // Our target is 8000 steps daily, do more sports!!!!
              value: ((double.tryParse(steps)!) / 8000) * 100,
              color: Theme.of(context).primaryColor,
              dashArray: const <double>[8, 2],
            ),
          ],
        ),
      ],
    );
  }
}
