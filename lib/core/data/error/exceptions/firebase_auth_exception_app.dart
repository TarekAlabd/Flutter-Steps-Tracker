import 'package:flutter_steps_tracker/core/data/error/exceptions/application_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_auth_exception_app.freezed.dart';

@freezed
@Implements()
abstract class FirebaseAuthExceptionApp extends ApplicationException
    with _$FirebaseAuthExceptionApp {
  factory FirebaseAuthExceptionApp.operationNotAllowed(
      {required String message}) = OperationNotAllowed;
}
