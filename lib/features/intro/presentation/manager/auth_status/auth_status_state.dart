import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status_state.freezed.dart';

@freezed
abstract class AuthStatusState with _$AuthStatusState {
  const factory AuthStatusState.authenticated() = Authenticated;

  const factory AuthStatusState.unAuthenticated() = UnAuthenticated;
}
