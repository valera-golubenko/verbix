import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../themes/app_theme.dart';

class OnboardingItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(imagePath, width: 320, height: 280),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
