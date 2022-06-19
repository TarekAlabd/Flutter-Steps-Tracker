import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utility_state.freezed.dart';

@freezed
class UtilityState with _$UtilityState {
  const factory UtilityState.initial() = Initial;
  const factory UtilityState.loading() = Loading;
  const factory UtilityState.reloadingTheme(bool isDark) = ReloadingTheme;
  const factory UtilityState.reloadingLocale(Locale locale) = ReloadingLocale;
  const factory UtilityState.changeState() = ChangeState;
  const factory UtilityState.error({required String message}) = Error;
}
