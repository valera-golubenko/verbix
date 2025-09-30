import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required ValueChanged<AuthEventsType> typedErrorHandler,
  }) async {
    return errorParser(() async {
      try {
        final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return UserModel.fromFirebase(credential.user)?.copyWith(
          signInType: SignType.email,
        );
      } on FirebaseAuthException catch (e) {
        final type = AuthEventsType.values.firstWhereOrNull((t) {
          return t.apiKey == e.code;
        });
        if (type != null) typedErrorHandler(type);
        if (type != null) return null;
        rethrow;
      }
    });
  }

  Future<void> appleAuth(
    ValueChanged<AuthAccountModel> successfulHandler,
  ) async {
    await safeAction(() async {
      emit(state.copyWith(status: StateStatus.refresh));
      final result = await _authService.signInApple();
      emit(state.copyWith(status: StateStatus.loaded));
      final data = result?.data;

      if (data == null) return;
      final accessToken = data.accessToken;
      final refreshToken = data.refreshToken;
      final showOnboarding = data.account.showOnboarding;
      final account = data.account;
      await _tokenService.saveToken(accessToken);
      await _tokenService.saveRefreshToken(refreshToken);
      await _completeOnboardingService.setCompleteOnboarding(!showOnboarding);
      await _authAccountStorage.saveAuthAccount(account);
      successfulHandler(account);
    });
  }

  Future<void> googleAuth(
    ValueChanged<AuthAccountModel> successfulHandler,
  ) async {
    await safeAction(() async {
      emit(state.copyWith(status: StateStatus.refresh));
      final result = await _authService.signInGoogle();
      emit(state.copyWith(status: StateStatus.loaded));
      final data = result?.data;

      if (data == null) return;
      final accessToken = data.accessToken;
      final refreshToken = data.refreshToken;
      final showOnboarding = data.account.showOnboarding;
      final account = data.account;
      await _tokenService.saveToken(accessToken);
      await _tokenService.saveRefreshToken(refreshToken);
      await _completeOnboardingService.setCompleteOnboarding(!showOnboarding);
      await _authAccountStorage.saveAuthAccount(account);
      successfulHandler(account);
    });
  }
}
