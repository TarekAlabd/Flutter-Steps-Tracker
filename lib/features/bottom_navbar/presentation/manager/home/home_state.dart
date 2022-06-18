import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.stepsAndPointsLoading() = StepsAndPointsLoading;

  const factory HomeState.stepsAndPointsLoaded({
    required int steps,
    required int healthPoints,
  }) = StepsAndPointsLoaded;

  const factory HomeState.stepsError({required String message}) = StepsError;

  const factory HomeState.loaded({required String steps}) = Loaded;

  const factory HomeState.feedbackGain({required String steps}) = FeedbackGain;

  const factory HomeState.error({required String message}) = Error;
}
