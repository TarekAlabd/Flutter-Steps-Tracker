// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Your All-in one Activity Tracker!`
  String get allInOneTrack {
    return Intl.message(
      'Your All-in one Activity Tracker!',
      name: 'allInOneTrack',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Start Using Steps`
  String get startUsingSteps {
    return Intl.message(
      'Start Using Steps',
      name: 'startUsingSteps',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong!',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Exchanges`
  String get exchanges {
    return Intl.message(
      'Exchanges',
      name: 'exchanges',
      desc: '',
      args: [],
    );
  }

  /// `Rewards`
  String get rewards {
    return Intl.message(
      'Rewards',
      name: 'rewards',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get leaderboard {
    return Intl.message(
      'Board',
      name: 'leaderboard',
      desc: '',
      args: [],
    );
  }

  /// `No Data Available!`
  String get emptyState {
    return Intl.message(
      'No Data Available!',
      name: 'emptyState',
      desc: '',
      args: [],
    );
  }

  /// `Available Rewards`
  String get availableRewards {
    return Intl.message(
      'Available Rewards',
      name: 'availableRewards',
      desc: '',
      args: [],
    );
  }

  /// `More coming soon!`
  String get moreComingSoon {
    return Intl.message(
      'More coming soon!',
      name: 'moreComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Pedometer`
  String get pedometer {
    return Intl.message(
      'Pedometer',
      name: 'pedometer',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You gained more health points`
  String get gainMorePoints {
    return Intl.message(
      'Congratulations! You gained more health points',
      name: 'gainMorePoints',
      desc: '',
      args: [],
    );
  }

  /// `Total Steps Today`
  String get totalStepsToday {
    return Intl.message(
      'Total Steps Today',
      name: 'totalStepsToday',
      desc: '',
      args: [],
    );
  }

  /// `Step Goal:`
  String get stepGoal {
    return Intl.message(
      'Step Goal:',
      name: 'stepGoal',
      desc: '',
      args: [],
    );
  }

  /// `Health Points`
  String get healthPoints {
    return Intl.message(
      'Health Points',
      name: 'healthPoints',
      desc: '',
      args: [],
    );
  }

  /// `Total Steps`
  String get totalSteps {
    return Intl.message(
      'Total Steps',
      name: 'totalSteps',
      desc: '',
      args: [],
    );
  }

  /// `Pts`
  String get points {
    return Intl.message(
      'Pts',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `QR Code`
  String get qrCode {
    return Intl.message(
      'QR Code',
      name: 'qrCode',
      desc: '',
      args: [],
    );
  }

  /// `Scan the QR Code and the points will be taken`
  String get scanQrCode {
    return Intl.message(
      'Scan the QR Code and the points will be taken',
      name: 'scanQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Dummy Done`
  String get dummyDone {
    return Intl.message(
      'Dummy Done',
      name: 'dummyDone',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get notice {
    return Intl.message(
      'Notice',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `Your points are less than the item's points, walk more and try again!`
  String get pointsLessThanItem {
    return Intl.message(
      'Your points are less than the item\'s points, walk more and try again!',
      name: 'pointsLessThanItem',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Earn`
  String get earn {
    return Intl.message(
      'Earn',
      name: 'earn',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
