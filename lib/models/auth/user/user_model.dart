import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../utils/email_validator.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@immutable
@Freezed(makeCollectionsUnmodifiable: false)
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    int? id,
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('') String avatar,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  bool get filledSignUp {
    return [
      fullName.isNotEmpty,
      email.isNotEmpty,
      password.isNotEmpty,
      confirmPassword.isNotEmpty,
    ].every((element) => element);
  }

  bool get matchedPasswords {
    return password == confirmPassword;
  }

  bool get passwordValidation {
    return password.length >= 6;
  }

  String? get emailValidation {
    return EmailValidator.validator(email);
  }
}
