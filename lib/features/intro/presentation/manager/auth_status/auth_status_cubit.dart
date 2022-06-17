import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/domain/use_cases/use_case.dart';
import 'package:flutter_steps_tracker/features/intro/domain/use_cases/auth_status_use_case.dart';
import 'package:flutter_steps_tracker/features/intro/presentation/manager/auth_status/auth_status_state.dart';
import 'package:flutter_steps_tracker/utilities/constants/enums.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthStatusCubit extends Cubit<AuthStatusState> {
  final AuthStatusUseCase _authStatusUseCase;

  AuthStatusCubit(
    this._authStatusUseCase,
  ) : super(
          const AuthStatusState.unAuthenticated(),
        );

  Future<void> checkAuthStatus() async {
    final status = await _authStatusUseCase(NoParams());
    switch (status) {
      case AuthStatus.authenticated:
        emit(const AuthStatusState.authenticated());
        break;
      case AuthStatus.unAuthenticated:
        emit(const AuthStatusState.unAuthenticated());
        break;
    }
  }
}
