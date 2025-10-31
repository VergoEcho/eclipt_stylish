import 'package:eclipt_stylish/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;
}
