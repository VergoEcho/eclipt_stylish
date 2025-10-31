// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for SignUpUsecase

@ProviderFor(signUpUsecase)
const signUpUsecaseProvider = SignUpUsecaseProvider._();

/// Provider for SignUpUsecase

final class SignUpUsecaseProvider
    extends $FunctionalProvider<SignUpUsecase, SignUpUsecase, SignUpUsecase>
    with $Provider<SignUpUsecase> {
  /// Provider for SignUpUsecase
  const SignUpUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignUpUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignUpUsecase create(Ref ref) {
    return signUpUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpUsecase>(value),
    );
  }
}

String _$signUpUsecaseHash() => r'878554d2f6dc0f92a71695fafc11bbd202d0d186';
