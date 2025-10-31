import 'package:eclipt_stylish/core/storages/shared_storage.dart';
import 'package:eclipt_stylish/features/onboarding/models/onboarding_page_data.dart';
import 'package:eclipt_stylish/features/onboarding/presentation/providers/onboarding_completion_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller_provider.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  late final PageController _pageController;
  late final SharedStorage _sharedStorage;

  @override
  int build() {
    _pageController = PageController();
    _sharedStorage = SharedStorage();

    ref.onDispose(() => _pageController.dispose());

    return 0; // Initial page index
  }

  PageController get pageController => _pageController;

  void onPageChanged(int index) => state = index;

  void nextPage() => _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

  void previousPage() => _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

  Future<void> skipOnboarding() async => await _completeOnboarding();

  Future<void> completeOnboarding() async => await _completeOnboarding();

  Future<void> _completeOnboarding() async {
    await _sharedStorage.initialize();
    await _sharedStorage.set(kOnboardingCompletedKey, true);
    // Invalidate the onboarding completion provider to trigger router refresh
    ref.invalidate(onboardingCompletionProvider);
  }
}
