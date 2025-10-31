// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for FirebaseAuthRemoteDatasource

@ProviderFor(firebaseAuthRemoteDatasource)
const firebaseAuthRemoteDatasourceProvider =
    FirebaseAuthRemoteDatasourceProvider._();

/// Provider for FirebaseAuthRemoteDatasource

final class FirebaseAuthRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          FirebaseAuthRemoteDatasource,
          FirebaseAuthRemoteDatasource,
          FirebaseAuthRemoteDatasource
        >
    with $Provider<FirebaseAuthRemoteDatasource> {
  /// Provider for FirebaseAuthRemoteDatasource
  const FirebaseAuthRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseAuthRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseAuthRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<FirebaseAuthRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseAuthRemoteDatasource create(Ref ref) {
    return firebaseAuthRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAuthRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAuthRemoteDatasource>(value),
    );
  }
}

String _$firebaseAuthRemoteDatasourceHash() =>
    r'29f83c81e44bb7840e6e841403a4a27e1ea0c60e';
