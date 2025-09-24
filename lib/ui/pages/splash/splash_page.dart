import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../routes/router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StackRouter get _router => context.router;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      _router.replace(const OnboardingFlowRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3EDFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Assets.images.fullLogo.image(width: 256, height: 84),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
