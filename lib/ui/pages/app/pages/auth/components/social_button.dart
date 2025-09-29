import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../l10n/localization_helper.dart';
import '../../../../../../models/enums/sign_type/sign_type.dart';
import '../../../../../../themes/app_theme.dart';
import '../../../../../views/buttons/app_button.dart';

class SocialButton extends StatelessWidget {
  final SignType type;
  final ValueSetter<SignType> onTap;

  const SocialButton({
    super.key,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () => onTap(type),
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
              type.getName(context.strings),
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
