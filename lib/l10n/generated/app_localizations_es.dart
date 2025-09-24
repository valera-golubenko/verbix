// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get flag => '🇪🇸';

  @override
  String get languages => 'Idiomas';

  @override
  String get languageName => 'Español';

  @override
  String get fonts => 'Fuentes';

  @override
  String get serverErrorMessage => 'Error del servidor';

  @override
  String get errorInternetConnection => 'Error de conexión a Internet';

  @override
  String get theme => 'Tema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get oops => 'Oops...';

  @override
  String get somethingWentWrong =>
      'Algo salió mal. Inténtalo más tarde o actualiza la pantalla';

  @override
  String get weakPassword => 'La contraseña proporcionada es demasiado débil.';

  @override
  String get emailAlreadyInUse =>
      'Ya existe una cuenta con este correo electrónico.';

  @override
  String get userNotFound =>
      'No se encontró ningún usuario con este correo electrónico.';

  @override
  String get invalidCredential =>
      'Correo electrónico o contraseña incorrectos. Inténtalo de nuevo o regístrate con este email.';

  @override
  String get wrongPassword => 'Contraseña incorrecta para este usuario.';

  @override
  String get noneAuthException => 'Datos ingresados incorrectos';

  @override
  String get fieldErrorPasswordNumbers => 'La contraseña debe incluir números';

  @override
  String get fieldErrorPasswordRegex => 'Caracteres válidos: \"A-Z, a-z, 0-9\"';

  @override
  String get fieldErrorPasswordMatch =>
      '*Las contraseñas deben coincidir. Por favor, inténtalo de nuevo.';

  @override
  String get fieldMustNotEmpty => 'El campo no debe estar vacío';

  @override
  String get incorrectEmail => 'Correo electrónico incorrecto';

  @override
  String get confirm => 'confirmar';

  @override
  String get cancel => 'cancelar';

  @override
  String get ok => 'Aceptar';

  @override
  String get verification => 'Verificación';
}
