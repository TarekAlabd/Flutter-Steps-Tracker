import 'package:flutter_steps_tracker/core/data/error/failures/application_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_auth_failure.freezed.dart';

@freezed
@Implements()
abstract class FirebaseAuthFailure extends Failure with _$FirebaseAuthFailure {
  const factory FirebaseAuthFailure.operationNotAllowed(
      {required String message}) = OperationNotAllowed;
}
