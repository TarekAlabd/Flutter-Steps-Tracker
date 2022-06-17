import 'package:dartz/dartz.dart';
import 'package:flutter_steps_tracker/core/data/error/failures/application_failure.dart';
import 'package:flutter_steps_tracker/utilities/constants/enums.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signInAnonymously(String name);
  Future<AuthStatus> hasAnAccount();
}
