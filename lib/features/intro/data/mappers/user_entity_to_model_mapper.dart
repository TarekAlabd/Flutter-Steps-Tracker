import 'package:flutter_steps_tracker/core/data/data_sources/database.dart';
import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/features/intro/domain/entities/user_entity.dart';

extension UserEntityToModelMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      uid: uid ?? documentIdFromLocalGenerator(),
      name: name,
    );
  }
}
