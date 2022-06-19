import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/domain/use_cases/use_case.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/entities/leaderboard_item_entity.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/use_cases/get_users_use_case.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/leaderboard/leaderboard_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LeaderboardCubit extends Cubit<LeaderboardState> {
  final GetUsersUseCase _getUsersUseCase;
  late Stream<List<LeaderboardItemEntity>> usersStream;

  LeaderboardCubit(
    this._getUsersUseCase,
  ) : super(const LeaderboardState.initial());

  /// TODO: We will split the data and separate them in the cubit in the future
  Future<void> getUsers() async {
    emit(const LeaderboardState.loading());
    final result = await _getUsersUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(const LeaderboardState.error(message: 'Something went wrong!')),
      (stream) => stream.listen((users) {
        users.sort((a, b) => b.totalSteps.compareTo(a.totalSteps));
        emit(LeaderboardState.loaded(users: users));
      }).onError(
        (error) => emit(
            const LeaderboardState.error(message: 'Something went wrong!')),
      ),
    );
  }
}
