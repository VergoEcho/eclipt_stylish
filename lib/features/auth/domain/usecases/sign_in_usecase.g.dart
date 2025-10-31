// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for SignInUsecase

@ProviderFor(signInUsecase)
const signInUsecaseProvider = SignInUsecaseProvider._();

/// Provider for SignInUsecase

final class SignInUsecaseProvider
    extends $FunctionalProvider<SignInUsecase, SignInUsecase, SignInUsecase>
    with $Provider<SignInUsecase> {
  /// Provider for SignInUsecase
  const SignInUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignInUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignInUsecase create(Ref ref) {
    return signInUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInUsecase>(value),
    );
  }
}

String _$signInUsecaseHash() => r'561c251cfc0d985b7a5f87fd187340eac02c71bb';
