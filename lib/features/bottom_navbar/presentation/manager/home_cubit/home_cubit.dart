import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/home_cubit/home_state.dart';
import 'package:injectable/injectable.dart';
import 'package:pedometer/pedometer.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  late Stream<StepCount> _stepCountStream;
  // late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _steps = '?';
  int _numOfGain = 1;

  HomeCubit() : super(const HomeState.initial());

  void initPlatformState() {
    emit(const HomeState.loading());
    // _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    // _pedestrianStatusStream
    //     .listen(onPedestrianStatusChanged)
    //     .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    // if (!mounted) return;
  }

  void onStepCount(StepCount event) {
    print(event);
    var oldSteps = int.tryParse(_steps) ?? 0;
    _steps = event.steps.toString();
    emit(HomeState.loaded(steps: _steps));
    if ((oldSteps % 100) > (event.steps % 100)) {
      emit(const HomeState.feedbackGain());
    }
  }

  // void onPedestrianStatusChanged(PedestrianStatus event) {
  //   print(event);
  //   setState(() {
  //     _status = event.status;
  //   });
  // }

  // void onPedestrianStatusError(error) {
  //   print('onPedestrianStatusError: $error');
  //   setState(() {
  //     _status = 'Pedestrian Status not available';
  //   });
  //   print(_status);
  // }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    _steps = 'Step Count not available';
    emit(HomeState.error(message: _steps));
    // setState(() {
    //   _steps = 'Step Count not available';
    // });
  }
}
