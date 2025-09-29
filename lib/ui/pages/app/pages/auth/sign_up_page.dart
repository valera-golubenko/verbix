import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/auth/sign_up/sign_up_cubit.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/localization_helper.dart';
import '../../../../../models/enums/sign_type/sign_type.dart';
import '../../../../../routes/router.dart';
import '../../../../../themes/app_theme.dart';

import '../../../../../themes/extensions/custom_designs.dart';
import '../../../../views/buttons/app_colored_button.dart';
import '../../../../views/fields/single_line_field.dart';
import 'components/social_button.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpCubit _cubit = context.read();

  AppLocalizations get _strings => context.strings;
  CustomDesigns get _designs => context.designs;
  TextTheme get _textTheme => context.textTheme;
  StackRouter get _router => context.router;
  TapGestureRecognizer get _recognizer => TapGestureRecognizer();

  Future<void> _signUpSocial(SignType type) async {
    switch (type) {
      case SignType.apple:
        return _cubit.appleAuth();

      case SignType.google:
        return _cubit.googleAuth();
    }
  }

  Future<void> _onSignIn() async {
    await _router.push(const SignInRoute());
  }

  @override
  Widget build(BuildContext context) {
    return AppConsumer<SignUpCubit, SignUpState>(
      builder: (state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(gradient: _designs.gradient),
              child: ListView(
                children: [
                  const SizedBox(height: 86, width: double.infinity),
                  _buildTitle(),
                  const SizedBox(height: 32),
                  _buildSocialAuthButton(SignType.apple).wrap,
                  const SizedBox(height: 24),
                  _buildSocialAuthButton(SignType.google).wrap,
                  const SizedBox(height: 24),
                  _buildOrDivider().wrap,
                  const SizedBox(height: 24),
                  _buildFullName().wrap,
                  const SizedBox(height: 16),
                  _buildEmail().wrap,
                  const SizedBox(height: 16),
                  _buildPassword().wrap,
                  const SizedBox(height: 16),
                  _buildConfirmPassword().wrap,
                  const SizedBox(height: 36),
                  _buildLetsGoButton().wrap,
                  const SizedBox(height: 16),
                  _buildAlreadyGotAnAccount().wrap
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      _strings.welcomeToVerbix,
      textAlign: TextAlign.center,
      style: _textTheme.headlineSmall?.copyWith(
        color: const Color(0xFF904113),
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildSocialAuthButton(SignType type) {
    return SocialButton(
      type: type,
      onTap: _signUpSocial,
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(child: _buildDivider()),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Text(_strings.oR, style: _textTheme.bodyMedium),
        ),
        Expanded(child: _buildDivider()),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }

  Widget _buildFullName() {
    return SingleLineField(
      controller: _cubit.fullNameController,
      hintText: _strings.fullName,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(Assets.svg.icons.user),
      ),
    );
  }

  Widget _buildEmail() {
    return SingleLineField(
      controller: _cubit.emailController,
      hintText: _strings.email,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(Assets.svg.icons.mail),
      ),
    );
  }

  Widget _buildPassword() {
    return SingleLineField(
      controller: _cubit.passwordController,
      hintText: _strings.password,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(Assets.svg.icons.lock),
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return SingleLineField(
      controller: _cubit.confirmPasswordController,
      hintText: _strings.confirmPassword,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(Assets.svg.icons.lock),
      ),
    );
  }

  Widget _buildLetsGoButton() {
    return AppColoredButton(
      onTap: () {},
      text: _strings.createAnAccount,
      color: const Color(0xFF2563EB),
      colorText: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(8),
    );
  }

  Widget _buildAlreadyGotAnAccount() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: _strings.alreadyGotAnAccount,
        style: _textTheme.bodyMedium,
        children: [
          const TextSpan(text: ' '),
          _buildSignUpSpan(),
        ],
      ),
    );
  }

  TextSpan _buildSignUpSpan() {
    return TextSpan(
      text: _strings.login.toUpperCase(),
      style: _textTheme.bodyMedium?.copyWith(
        color: const Color(0xFF2563EB),
        fontWeight: FontWeight.w700,
      ),
      recognizer: _recognizer..onTap = _onSignIn,
    );
  }
}

extension _WidgetExt on Widget {
  Widget get wrap {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: this,
    );
  }
}
