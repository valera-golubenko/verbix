import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/localization_helper.dart';
import '../../../../../routes/router.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../views/buttons/app_colored_button.dart';
import 'components/onboarding_item.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  AppLocalizations get _strings => context.strings;
  TextTheme get _textTheme => context.textTheme;
  StackRouter get _router => context.router;
  TapGestureRecognizer get _recognizer => TapGestureRecognizer();
  late final PageController _pageController;
  int _currentPage = 0;

  List<OnboardingItem> get onboardingItems => [
        OnboardingItem(
            imagePath: Assets.svg.onboarding1,
            title: _strings.learnWordsNotRules,
            description: _strings.rememberNewEnglishWords),
        OnboardingItem(
            imagePath: Assets.svg.onboarding2,
            title: _strings.yourPersonalProgress,
            description: _strings.trackYourResultsAndStay),
        OnboardingItem(
            imagePath: Assets.svg.onboarding3,
            title: _strings.practiceWithoutBoredom,
            description: _strings.quizzesFlashcardsAndRepetitions),
      ];

  Future<void> _onSignUp() async {
    await _router.push(const AuthFlowRoute());
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  void _goToNextPage() {
    final pagesCount = onboardingItems.length;
    if (_currentPage < pagesCount - 1) {
      _currentPage += 1;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40, width: double.infinity),
            Expanded(child: _buildPages().wrap),
            const SizedBox(height: 40),
            _buildLetsGoButton().wrap,
            const SizedBox(height: 16),
            _buildAlreadyGotAnAccount().wrap,
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPages() {
    return PageView(
      controller: _pageController,
      onPageChanged: (i) => setState(() => _currentPage = i),
      children: onboardingItems,
    );
  }

  Widget _buildLetsGoButton() {
    return AppColoredButton(
      onTap: _goToNextPage,
      text: _strings.letsGo,
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
        style: _textTheme.bodyMedium?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
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
