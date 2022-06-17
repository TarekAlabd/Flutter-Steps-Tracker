import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/core/data/data_sources/cache_helper.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/utilities/constants/key_constants.dart';
import 'package:injectable/injectable.dart';

import 'locale_state.dart';

@singleton
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState.initial());
  Locale _locale = KeyConstants.arabicLocale;
  Locale get locale => _locale;
  Future getCurrentLocale() async {
    final chasheHelper = getIt<CacheHelper>();
    final checkIfAppLocaleSetKey = await chasheHelper.checkIfAppLocaleSetKey(
        isAppLocaleSetKey: KeyConstants.isAppLocaleSet);
    if (checkIfAppLocaleSetKey != null && checkIfAppLocaleSetKey) {
      final hasLocale = await chasheHelper.has(key: KeyConstants.localeKey);
      if (hasLocale != null && hasLocale) {
        final String? currentLocaleString =
            await chasheHelper.get(key: KeyConstants.localeKey);
        if (currentLocaleString != null) {
          final tempLocale = Locale.fromSubtags(
              languageCode: currentLocaleString.split("_").first,
              countryCode: currentLocaleString.split("_").last);
          _locale = tempLocale;
        }
      }
    } else {
      final String deviceLocale = Platform.localeName;
      log("device-locale is $deviceLocale");
      if (deviceLocale.contains("ar")) {
        _locale = KeyConstants.arabicLocale;
      } else {
        _locale = KeyConstants.englishLocale;
      }
      await chasheHelper.put(
        key: KeyConstants.localeKey,
        value: locale.toString(),
      );
      await chasheHelper.put(
        key: KeyConstants.isAppLocaleSet,
        value: false.toString(),
      );
    }
    emit(
      LocaleState.localechanged(
        dateTime: DateTime.now(),
      ),
    );
  }

  Future changeLocale({required Locale updatedLocale}) async {
    final chasheHelper = getIt<CacheHelper>();
    await chasheHelper.put(
      key: KeyConstants.isAppLocaleSet,
      value: true.toString(),
    );
    await chasheHelper.put(
      key: KeyConstants.localeKey,
      value: updatedLocale.toString(),
    );
    _locale = Locale.fromSubtags(
        countryCode: updatedLocale.countryCode,
        languageCode: updatedLocale.languageCode);
    emit(
      LocaleState.localechanged(
        dateTime: DateTime.now(),
      ),
    );
  }
}
