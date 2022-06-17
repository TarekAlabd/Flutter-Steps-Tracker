import 'package:dartz/dartz.dart';
import 'package:flutter_steps_tracker/core/data/error/failures/application_failure.dart';
import 'package:flutter_steps_tracker/core/domain/use_cases/use_case.dart';
import 'package:flutter_steps_tracker/features/intro/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInAnonymouslyUseCase
    extends UseCase<Future<Either<Failure, void>>, String> {
  final AuthRepository authRepository;

  SignInAnonymouslyUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(String params) async =>
      await authRepository.signInAnonymously(
        params,
      );
}
