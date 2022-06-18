import 'dart:convert';

import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/utilities/constants/key_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> persistAuth(UserModel user);

  Future<UserModel?> currentUser();
}

@Singleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<UserModel?> currentUser() async {
    if (_sharedPreferences.containsKey(KeyConstants.currentUser)) {
      final currentUserAsJSON =
          json.decode(_sharedPreferences.getString(KeyConstants.currentUser)!);
      final user = UserModel.fromMap(
        currentUserAsJSON,
        currentUserAsJSON['uid'] ?? '',
      );
      return user;
    }
    return null;
  }

  @override
  Future<void> persistAuth(UserModel user) async {
    final encodedJson = json.encode(user.toMap());
    _sharedPreferences.setString(
      KeyConstants.currentUser,
      encodedJson.toString(),
    );
  }
}
