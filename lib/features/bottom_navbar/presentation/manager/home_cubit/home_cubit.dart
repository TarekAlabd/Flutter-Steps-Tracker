import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home_cubit/home_state.dart';
import 'package:injectable/injectable.dart';
import 'package:pedometer/pedometer.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  late Stream<StepCount> _stepCountStream;
  String _steps = '?';

  HomeCubit() : super(const HomeState.initial());

  void initPlatformState() {
    emit(const HomeState.loading());
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  void onStepCount(StepCount event) {
    debugPrint(event.toString());
    var oldSteps = int.tryParse(_steps) ?? 0;
    _steps = event.steps.toString();
    emit(HomeState.loaded(steps: _steps));
    if ((oldSteps % 100) > (event.steps % 100)) {
      emit(HomeState.feedbackGain(steps: _steps));
    }
  }

  void onStepCountError(error) {
    debugPrint('onStepCountError: $error');
    _steps = 'Step Count not available';
    emit(HomeState.error(message: _steps));
  }
}
