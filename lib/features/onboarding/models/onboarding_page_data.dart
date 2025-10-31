class OnboardingPageData {
  final String svgAsset;
  final String title;
  final String description;

  const OnboardingPageData({
    required this.svgAsset,
    required this.title,
    required this.description,
  });
}

/// SharedPreferences key for onboarding completion status
const String kOnboardingCompletedKey = 'onboarding_completed';
