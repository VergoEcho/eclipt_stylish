import 'package:eclipt_stylish/core/core.dart';
import 'package:eclipt_stylish/core/screens/splash_screen.dart';
import 'package:eclipt_stylish/features/auth/auth.dart';
import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';
import 'package:eclipt_stylish/features/home/presentation/screens/home_screen.dart';
import 'package:eclipt_stylish/features/home/presentation/screens/set_up_account_screen.dart';
import 'package:eclipt_stylish/features/onboarding/presentation/providers/providers.dart';
import 'package:eclipt_stylish/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_route.g.dart';
part 'route_config.dart';

@riverpod
GoRouter router(Ref ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'main');
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  final isOnboardingCompleted = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  final currentUser = ValueNotifier<AsyncValue<UserEntity?>>(const AsyncLoading());
  ref.onDispose(isAuth.dispose);
  ref.onDispose(isOnboardingCompleted.dispose);
  ref.onDispose(currentUser.dispose);

  ref.listen(authControllerProvider, (prev, next) {
    if (prev == next) return;
    isAuth.value = next;
  });

  ref.listen(onboardingCompletionProvider, (prev, next) {
    if (prev == next) return;
    isOnboardingCompleted.value = next;
  });

  ref.listen(currentUserProvider, (prev, next) {
    if (prev == next) return;
    currentUser.value = next;
  });

  final routes = buildRoutes();

  final router = GoRouter(
    navigatorKey: routerKey,
    initialLocation: Routes.splash.path,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: Listenable.merge([isAuth, isOnboardingCompleted, currentUser]),
    routes: routes,
    redirect: (context, state) {
      final isSplash = state.uri.path == Routes.splash.path;
      final isSetUpAccount = state.uri.path == Routes.setUpAccount.path;

      // Wait for all providers to have a value (data or error) or finish loading
      // Error states are treated as "has value" since they're terminal states
      final isAuthReady = isAuth.value.hasValue || isAuth.value.hasError;
      final isOnboardingReady = isOnboardingCompleted.value.hasValue || isOnboardingCompleted.value.hasError;
      final isUserReady = currentUser.value.hasValue || currentUser.value.hasError;

      final noValueOrLoading = !isAuthReady || !isOnboardingReady || !isUserReady;

      // Stay on splash while loading
      if (noValueOrLoading) {
        return isSplash ? null : Routes.splash.path;
      }

      // Get values with safe defaults for error cases
      final auth = isAuth.value.hasValue ? isAuth.value.requireValue : false;
      final onboardingCompleted = isOnboardingCompleted.value.hasValue ? isOnboardingCompleted.value.requireValue : true;
      final user = currentUser.value.hasValue ? currentUser.value.requireValue : null;

      // Redirect from splash to appropriate screen
      if (isSplash) {
        if (!onboardingCompleted) {
          return Routes.onboarding.path;
        }
        if (!auth) {
          return Routes.login.path;
        }

        // Check if authenticated user needs to complete profile
        if (user?.displayText == null || user!.displayText!.isEmpty) {
          return Routes.setUpAccount.path;
        }

        return Routes.home.path;
      }

      // Global onboarding guard
      if (!onboardingCompleted && state.uri.path != Routes.onboarding.path) {
        return Routes.onboarding.path;
      }

      // Global authentication guard - redirect unauthenticated users to login
      if (!auth && state.uri.path != Routes.login.path && state.uri.path != Routes.register.path) {
        return Routes.login.path;
      }

      // Redirect authenticated users without displayText to setup screen
      // Exclude login/register to avoid stale data during transition
      if (auth && !isSetUpAccount &&
          state.uri.path != Routes.login.path &&
          state.uri.path != Routes.register.path) {
        if (user?.displayText == null || user!.displayText!.isEmpty) {
          return Routes.setUpAccount.path;
        }
      }

      // Redirect away from setup account if profile is complete
      if (auth && isSetUpAccount) {
        if (user?.displayText != null && user!.displayText!.isNotEmpty) {
          return Routes.home.path;
        }
      }

      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
}
