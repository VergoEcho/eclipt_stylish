part of 'app_route.dart';

List<GoRoute> buildRoutes() {
  return [
    GoRoute(
      path: Routes.splash.path,
      name: Routes.splash.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.onboarding.path,
      name: Routes.onboarding.name,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.login.path,
      name: Routes.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register.path,
      name: Routes.register.name,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: Routes.setUpAccount.path,
      name: Routes.setUpAccount.name,
      builder: (context, state) => const SetUpAccountScreen(),
    ),
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ];
}
