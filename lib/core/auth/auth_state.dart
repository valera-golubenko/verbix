part of 'auth_cubit.dart';

@freezed
abstract class AuthState extends BaseStateI with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String message,
    @Default('') String email,
  }) = _AuthState;
}
