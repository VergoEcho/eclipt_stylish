// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_completion_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingCompletion)
const onboardingCompletionProvider = OnboardingCompletionProvider._();

final class OnboardingCompletionProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const OnboardingCompletionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingCompletionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingCompletionHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return onboardingCompletion(ref);
  }
}

String _$onboardingCompletionHash() =>
    r'175da23cabf9c1298f679764a53bd6116f241596';
