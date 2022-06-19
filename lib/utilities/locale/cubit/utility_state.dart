import 'package:freezed_annotation/freezed_annotation.dart';

part 'utility_state.freezed.dart';

@freezed
class UtilityState with _$UtilityState {
  const factory UtilityState.initial() = Initial;
  const factory UtilityState.loading() = Loading;
  const factory UtilityState.reloadingTheme() = ReloadingTheme;
  const factory UtilityState.loaded() = Loaded;
  const factory UtilityState.changeState() = ChangeState;
  const factory UtilityState.error({required String message}) = Error;
}
