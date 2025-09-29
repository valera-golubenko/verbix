part of 'sign_in_cubit.dart';

@freezed
abstract class SignInState extends BaseStateI with _$SignInState {
  const SignInState._();

  const factory SignInState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String message,
    @Default('') String email,
  }) = _SignInState;
}
