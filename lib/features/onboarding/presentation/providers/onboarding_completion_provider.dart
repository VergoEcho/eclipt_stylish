import 'package:eclipt_stylish/core/storages/shared_storage.dart';
import 'package:eclipt_stylish/features/onboarding/models/onboarding_page_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_completion_provider.g.dart';

@riverpod
Future<bool> onboardingCompletion(Ref ref) async {
  final storage = SharedStorage();
  await storage.initialize();
  final completed = await storage.get<bool>(kOnboardingCompletedKey);
  return completed ?? false;
}
