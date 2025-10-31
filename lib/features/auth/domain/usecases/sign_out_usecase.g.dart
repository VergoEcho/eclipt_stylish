// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for SignOutUsecase

@ProviderFor(signOutUsecase)
const signOutUsecaseProvider = SignOutUsecaseProvider._();

/// Provider for SignOutUsecase

final class SignOutUsecaseProvider
    extends $FunctionalProvider<SignOutUsecase, SignOutUsecase, SignOutUsecase>
    with $Provider<SignOutUsecase> {
  /// Provider for SignOutUsecase
  const SignOutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signOutUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signOutUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignOutUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignOutUsecase create(Ref ref) {
    return signOutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignOutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignOutUsecase>(value),
    );
  }
}

String _$signOutUsecaseHash() => r'16d348c837c5f25edd217a33c8fc45d7a927d94b';
