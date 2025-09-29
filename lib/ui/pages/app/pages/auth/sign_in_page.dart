import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/auth/sign_up/sign_up_cubit.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/localization_helper.dart';
import '../../../../../models/enums/sign_type/sign_type.dart';
import '../../../../../routes/router.dart';
import '../../../../../themes/app_theme.dart';

import '../../../../../themes/extensions/custom_designs.dart';
import '../../../../views/buttons/app_button.dart';
import '../../../../views/buttons/app_colored_button.dart';
import '../../../../views/fields/single_line_field.dart';
import 'components/social_button.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SignUpCubit _cubit = context.read();

  AppLocalizations get _strings => context.strings;
  CustomDesigns get _designs => context.designs;
  TextTheme get _textTheme => context.textTheme;
  StackRouter get _router => context.router;
  TapGestureRecognizer get _recognizer => TapGestureRecognizer();

  Future<void> _onSignUp() async {
    await _router.push(const SignUpRoute());
  }

  Future<void> _routeToBack() async {
    await _router.maybePop();
  }

  Future<void> _signUpSocial(SignType type) async {
    switch (type) {
      case SignType.apple:
        return _cubit.appleAuth();

      case SignType.google:
        return _cubit.googleAuth();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: _designs.gradient),
          child: ListView(
            children: [
              _buildAppBar(),
              const SizedBox(height: 32, width: double.infinity),
              Assets.images.fullLogo.image(width: 180, height: 60),
              const SizedBox(height: 24),
              _buildEmail().wrap,
              const SizedBox(height: 16),
              _buildPassword().wrap,
              const SizedBox(height: 24),
              _buildLoginButton().wrap,
              const SizedBox(height: 24),
              _buildOrDivider().wrap,
              const SizedBox(height: 24),
              _buildSocialAuthButton(SignType.apple).wrap,
              const SizedBox(height: 24),
              _buildSocialAuthButton(SignType.google).wrap,
              const SizedBox(height: 24),
              _buildAreYouNotRegistered().wrap
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        AppButton(
          onTap: _routeToBack,
          child: SvgPicture.asset(Assets.svg.icons.chevronLeft),
        ),
        Expanded(
          child: Text(
            _strings.signIn,
            textAlign: TextAlign.center,
            style: _textTheme.headlineSmall?.copyWith(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(width: 48),
      ],
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

  Widget _buildLoginButton() {
    return AppColoredButton(
      onTap: () {},
      text: _strings.login,
      color: const Color(0xFF2563EB),
      colorText: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(8),
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

  Widget _buildSocialAuthButton(SignType type) {
    return SocialButton(
      type: type,
      onTap: _signUpSocial,
    );
  }

  Widget _buildAreYouNotRegistered() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: _strings.areYouNotRegistered,
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
      text: _strings.register,
      style: _textTheme.bodyMedium?.copyWith(
        color: const Color(0xFF2563EB),
        fontWeight: FontWeight.w700,
      ),
      recognizer: _recognizer..onTap = _onSignUp,
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
