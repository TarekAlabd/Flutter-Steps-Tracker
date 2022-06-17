import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/core/data/error/failures/firebase_auth_failure.dart';
import 'package:flutter_steps_tracker/features/intro/domain/use_cases/sign_in_anonymously_use_case.dart';
import 'package:flutter_steps_tracker/features/intro/presentation/manager/auth_actions/auth_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final SignInAnonymouslyUseCase _signInAnonymouslyUseCase;

  AuthCubit(
    this._signInAnonymouslyUseCase,
  ) : super(const AuthState.initial());

  Future<void> signInAnonymously({required String name}) async {
    emit(const AuthState.loading());
    final result = await _signInAnonymouslyUseCase(name);
    emit(
      result.fold(
        (failure) {
          if (failure is FirebaseAuthFailure) {
            failure.maybeWhen(
                orElse: () =>
                    const AuthState.error(message: 'Something went wrong!'),
                operationNotAllowed: (message) =>
                    AuthState.error(message: message));
          }
          return const AuthState.error(message: 'Something went wrong!');
        },
        (_) => const AuthState.loggedIn(),
      ),
    );
  }
}
