import 'dart:async';

import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'auth_mixin.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends BaseCubit<AuthState> with AuthCubitMix {
  AuthCubit() : super(const AuthState());

  Future<void> init() async {
    safeAction(() async {
      emit(state.copyWith(status: StateStatus.loaded));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  Future<void> getPosts() async {
    await safeAction(() async {
      emit(state.copyWith(status: StateStatus.refresh));
    });
    emit(state.copyWith(status: StateStatus.loaded));
  }

  Future<void> appleAuth() async {}

  Future<void> googleAuth() async {}
}
