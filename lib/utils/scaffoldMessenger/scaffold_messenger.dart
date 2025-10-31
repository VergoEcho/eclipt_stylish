import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../logger/logger.dart';
import 'snackbar.dart';
import 'snackbar_palette.dart';

part 'scaffold_messenger.g.dart';

enum SnackBarType {
  success,
  warning,
  error,
  info;

  Color background(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return switch (this) {
      success => isDark ? SnackBarPalette.successBgDark : SnackBarPalette.successBg,
      warning => isDark ? SnackBarPalette.warningBgDark : SnackBarPalette.warningBg,
      error => isDark ? SnackBarPalette.errorBgDark : SnackBarPalette.errorBg,
      info => isDark ? SnackBarPalette.infoBgDark : SnackBarPalette.infoBg,
    };
  }

  Color text(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return switch (this) {
      success => isDark ? SnackBarPalette.successDark : SnackBarPalette.success,
      warning => isDark ? SnackBarPalette.warningDark : SnackBarPalette.warning,
      error => isDark ? SnackBarPalette.errorDark : SnackBarPalette.error,
      info => isDark ? SnackBarPalette.infoDark : SnackBarPalette.info,
    };
  }

  Color border(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return switch (this) {
      success => isDark ? SnackBarPalette.successBorderDark : SnackBarPalette.successBorder,
      warning => isDark ? SnackBarPalette.warningBorderDark : SnackBarPalette.warningBorder,
      error => isDark ? SnackBarPalette.errorBorderDark : SnackBarPalette.errorBorder,
      info => isDark ? SnackBarPalette.infoBorderDark : SnackBarPalette.infoBorder,
    };
  }

  IconData get icon => switch (this) {
    success => Icons.check_circle_outline_rounded,
    warning => Icons.warning_amber_rounded,
    error => Icons.error_outline_rounded,
    info => Icons.info_outline_rounded,
  };
}

/// A service to show SnackBars using the ScaffoldMessenger.
/// It provides a simple interface to display messages with different types
/// Pass different kinds of SnackBarType ([success], [warning], [error], [info])
/// to customize it appearance.
///
/// Accessible everywhere in the app via [scaffoldMessengerServiceProvider]
/// or context extension [context.showSnackBar()].
@riverpod
class ScaffoldMessengerService extends _$ScaffoldMessengerService {
  @override
  GlobalKey<ScaffoldMessengerState> build() =>
      GlobalKey<ScaffoldMessengerState>();

  void showSnackBar(
    String message, {
    double? bottomOffset,
    SnackBarType? type,
  }) {
    if (state.currentState == null) {
      log.e(
        'Error: Failed to show snackbar message: "$message"\n'
        'ScaffoldMessenger isn\'t initialized yet',
      );

      return;
    }
    state.currentState?.showSnackBar(
      snackBar(
        state,
        message,
        bottomOffset: bottomOffset,
        type: type ?? SnackBarType.info,
      ),
    );
  }
}
