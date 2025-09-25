// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get flag => '🇬🇧';

  @override
  String get languages => 'Languages';

  @override
  String get languageName => 'English';

  @override
  String get fonts => 'Fonts';

  @override
  String get serverErrorMessage => 'Server error occurred';

  @override
  String get errorInternetConnection => 'Internet Connection Error';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get oops => 'Ooops...';

  @override
  String get somethingWentWrong =>
      'Something went wrong. Try again later or update the screen';

  @override
  String get weakPassword => 'The password provided is too weak.';

  @override
  String get emailAlreadyInUse => 'The account already exists for that email.';

  @override
  String get userNotFound => 'No user found for that email.';

  @override
  String get invalidCredential =>
      'Incorrect email or password. Please try again or register an account with this email.';

  @override
  String get wrongPassword => 'Wrong password provided for that user.';

  @override
  String get noneAuthException => 'Incorrect credential';

  @override
  String get fieldErrorPasswordNumbers => 'Password must be include numbers';

  @override
  String get fieldErrorPasswordRegex => 'Valid characters: \"A-Z, a-z, 0-9\"';

  @override
  String get fieldErrorPasswordMatch =>
      '*Passwords need to match. Please try again.';

  @override
  String get fieldMustNotEmpty => 'Field must not be empty';

  @override
  String get incorrectEmail => 'Incorrect email';

  @override
  String get confirm => 'confirm';

  @override
  String get cancel => 'cancel';

  @override
  String get ok => 'OK';

  @override
  String get verification => 'Verification';

  @override
  String get learnWordsNotRules => 'Learn Words, Not Rules';

  @override
  String get rememberNewEnglishWords =>
      'Remember new English words easily and quickly.';

  @override
  String get yourPersonalProgress => 'Your Personal Progress';

  @override
  String get trackYourResultsAndStay =>
      'Track your results and stay motivated every day.';

  @override
  String get practiceWithoutBoredom => 'Practice Without Boredom';

  @override
  String get quizzesFlashcardsAndRepetitions =>
      'Quizzes, flashcards, and repetitions — in a simple format.';

  @override
  String get alreadyGotAnAccount => 'Already got an account?';

  @override
  String get letsGo => 'Let\'s go!';

  @override
  String get login => 'Login';
}
