import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/auth/auth_cubit.dart';
import '../../../../../l10n/localization_helper.dart';
import '../../../../../models/enums/sign_type/sign_type.dart';
import '../../../../../routes/router.dart';
import '../../../../../themes/app_theme.dart';

import '../../../../../themes/extensions/custom_designs.dart';
import '../../../../views/buttons/app_button.dart';
import '../../../../views/buttons/app_colored_button.dart';
import '../../../../views/fields/single_line_field.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final AuthCubit _cubit = context.read();

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
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48, width: double.infinity),
            Text(
              _strings.welcomeToVerbix,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF924216),
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 24),
            _buildSocialAuthButton(SignType.apple).wrap,
            const SizedBox(height: 24),
            _buildSocialAuthButton(SignType.google).wrap,
            const SizedBox(height: 24),
            _buildOrDivider().wrap,
            const SizedBox(height: 24),
            SingleLineField(controller: _cubit.emailController).wrap,
            const SizedBox(height: 24),
            SingleLineField(controller: _cubit.emailController).wrap,
            const SizedBox(height: 24),
            SingleLineField(controller: _cubit.emailController).wrap,
            const SizedBox(height: 24),
            _buildLetsGoButton().wrap,
            const SizedBox(height: 16),
            _buildAlreadyGotAnAccount()
          ],
        ),
      ),
    );
  }

  Widget _buildSocialAuthButton(SignType type) {
    return AppButton(
      onTap: () => _signUpSocial(type),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFE9EFFD),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(type.icon),
            const SizedBox(width: 8),
            Text(
              type.getName(_strings),
              style: _textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
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
