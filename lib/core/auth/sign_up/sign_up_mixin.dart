import 'package:flutter/material.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';

import 'sign_up_cubit.dart';

mixin SignUpCubitMix on BaseCubit<SignUpState> {
  late final fullNameController = TextEditingController()
    ..clear()
    ..addListener(_fullNameHandler);

  late final emailController = TextEditingController()
    ..clear()
    ..addListener(_emailHandler);

  late final passwordController = TextEditingController()
    ..clear()
    ..addListener(_passwordHandler);

  late final confirmPasswordController = TextEditingController()
    ..clear()
    ..addListener(_confirmPasswordHandler);

  @override
  Future<void> close() {
    fullNameController.removeListener(_fullNameHandler);
    emailController.removeListener(_emailHandler);
    passwordController.removeListener(_passwordHandler);
    confirmPasswordController.removeListener(_confirmPasswordHandler);
    return super.close();
  }

  void _fullNameHandler() {
    emit(state.copyWith(email: fullNameController.text.trim()));
  }

  void _emailHandler() {
    emit(state.copyWith(email: emailController.text.trim()));
  }

  void _passwordHandler() {
    emit(state.copyWith(email: passwordController.text.trim()));
  }

  void _confirmPasswordHandler() {
    emit(state.copyWith(email: confirmPasswordController.text.trim()));
  }
}
