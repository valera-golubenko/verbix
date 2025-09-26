import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/app_localizations.dart';

enum SignType {
  apple,
  google;

  String get icon {
    switch (this) {
      case apple:
        return Assets.svg.icons.apple;
      case google:
        return Assets.svg.icons.google;
    }
  }

  String getName(AppLocalizations strings) {
    switch (this) {
      case apple:
        return strings.signUpWithApple;
      case google:
        return strings.signUpWithGoogle;
    }
  }
}
