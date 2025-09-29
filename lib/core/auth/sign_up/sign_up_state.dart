part of 'sign_up_cubit.dart';

@freezed
abstract class SignUpState extends BaseStateI with _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String message,
    @Default('') String email,
  }) = _SignUpState;
}
