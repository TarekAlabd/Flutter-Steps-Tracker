import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/data/data_sources/cache_helper.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/utilities/constants/key_constants.dart';
import 'package:flutter_steps_tracker/utilities/locale/cubit/utility_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class UtilityCubit extends Cubit<UtilityState> {
  UtilityCubit() : super(const UtilityState.initial());

  Locale locale = KeyConstants.englishLocale;
  bool isDark = false;

  ThemeMode currentTheme() => isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> getCurrentTheme() async {
    await getIt<CacheHelper>().has(KeyConstants.theme).then((hasToken) async {
      debugPrint('Has Token: $hasToken');
      if (hasToken) {
        await getIt<CacheHelper>().get(KeyConstants.theme).then((value) async {
          debugPrint('Value isDark: $value');
          isDark = value as bool;
        });
      } else {
        isDark = false;
      }
    });
    emit(const UtilityState.changeState());
  }

  Future<void> switchTheme() async {
    isDark = !isDark;
    await getIt<CacheHelper>().put(KeyConstants.theme, isDark);
    emit(UtilityState.reloadingTheme(isDark));
  }

  Future<void> getCurrentLocale() async {
    await getIt<CacheHelper>()
        .has(KeyConstants.localeKey)
        .then((hasToken) async {
      if (hasToken) {
        await getIt<CacheHelper>()
            .get(KeyConstants.localeKey)
            .then((value) async {
          locale = Locale.fromSubtags(
              languageCode: value.split('_').first,
              countryCode: value.split('_').last);
        });
      } else {
        locale = KeyConstants.englishLocale;
      }
    });
    emit(const UtilityState.changeState());
  }

  Future<void> changeLocale(Locale lc) async {
    locale = lc;
    await getIt<CacheHelper>().put(KeyConstants.localeKey, locale.toString());
    debugPrint('changedLocale');
    emit(UtilityState.reloadingLocale(locale));
  }
}
