import 'package:dartz/dartz.dart';
import 'package:flutter_steps_tracker/core/data/error/failures/application_failure.dart';
import 'package:flutter_steps_tracker/core/data/models/user_model.dart';
import 'package:flutter_steps_tracker/core/domain/use_cases/use_case.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/repositories/bottom_navbar_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase
    extends UseCase<Future<Either<Failure, Stream<UserModel>>>, NoParams> {
  final BottomNavbarRepository _bottomNavbarRepository;

  GetUserDataUseCase(this._bottomNavbarRepository);

  @override
  Future<Either<Failure, Stream<UserModel>>> call(NoParams params) async =>
      await _bottomNavbarRepository.getRealTimeUserData();
}
