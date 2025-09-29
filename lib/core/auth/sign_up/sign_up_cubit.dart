import 'dart:async';

import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'sign_up_mixin.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

@injectable
class SignUpCubit extends BaseCubit<SignUpState> with SignUpCubitMix {
  SignUpCubit() : super(const SignUpState());

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
