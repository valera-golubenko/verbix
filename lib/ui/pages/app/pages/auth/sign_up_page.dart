import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/localization_helper.dart';
import '../../../../../routes/router.dart';
import '../../../../../themes/app_theme.dart';

import '../../../../../themes/extensions/custom_designs.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AppLocalizations get _strings => context.strings;
  CustomDesigns get _designs => context.designs;
  TextTheme get _textTheme => context.textTheme;
  StackRouter get _router => context.router;
  TapGestureRecognizer get _recognizer => TapGestureRecognizer();

  Future<void> _onSignIn() async {
    await _router.push(const SignInRoute());
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
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(title: Text('Sign Up')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20, width: double.infinity),
            _buildAlreadyGotAnAccount()
          ],
        ),
      ),
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
