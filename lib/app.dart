import 'package:eclipt_stylish/core/core.dart';
import 'package:eclipt_stylish/l10n/generated/app_localizations.dart';
import 'package:eclipt_stylish/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StylishApp extends HookConsumerWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final scaffoldMessengerKey = ref.watch(scaffoldMessengerServiceProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: child,
      ),
      themeMode: ThemeMode.light,
      theme: StylishTheme.lightTheme,
      locale: const Locale("en"),
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
