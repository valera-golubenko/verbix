import 'package:flutter/material.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';

import 'auth_cubit.dart';

mixin AuthCubitMix on BaseCubit<AuthState> {
  late final emailController = TextEditingController()
    ..clear()
    ..addListener(_emailHandler);

  @override
  Future<void> close() {
    emailController.removeListener(_emailHandler);
    return super.close();
  }

  void _emailHandler() {
    emit(state.copyWith(email: emailController.text.trim()));
  }
}
