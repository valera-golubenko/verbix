import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../routes/router.dart';
import '../../../../views/buttons/app_primary_button.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20, width: double.infinity),
            SvgPicture.asset(Assets.svg.onboarding1),
            const SizedBox(height: 20),
            const Text(
              'Example Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'This is the main example page of the app template',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            AppPrimaryButton(
              onTap: () => context.router.push(const SettingsRoute()),
              text: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
