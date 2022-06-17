import 'package:freezed_annotation/freezed_annotation.dart';
part 'locale_state.freezed.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.initial() = Initial;
  const factory LocaleState.localechanged({required DateTime dateTime}) =
      LocaleChanged;
}
