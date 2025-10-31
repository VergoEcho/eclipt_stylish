import 'package:eclipt_stylish/app.dart';
import 'package:eclipt_stylish/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      observers: [_ProviderErrorsObserver()],
      child: const StylishApp(),
    ),
  );
}

final class _ProviderErrorsObserver extends ProviderObserver {
  @override
  void providerDidFail(provider, error, stackTrace) => Logger().e(
    'Provider $provider threw $error\nTrace: $stackTrace',
    error: error,
    stackTrace: stackTrace,
  );
}
