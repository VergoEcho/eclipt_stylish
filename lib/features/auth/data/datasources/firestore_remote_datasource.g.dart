// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for FirestoreRemoteDatasource

@ProviderFor(firestoreRemoteDatasource)
const firestoreRemoteDatasourceProvider = FirestoreRemoteDatasourceProvider._();

/// Provider for FirestoreRemoteDatasource

final class FirestoreRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          FirestoreRemoteDatasource,
          FirestoreRemoteDatasource,
          FirestoreRemoteDatasource
        >
    with $Provider<FirestoreRemoteDatasource> {
  /// Provider for FirestoreRemoteDatasource
  const FirestoreRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<FirestoreRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirestoreRemoteDatasource create(Ref ref) {
    return firestoreRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirestoreRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirestoreRemoteDatasource>(value),
    );
  }
}

String _$firestoreRemoteDatasourceHash() =>
    r'addbdd77e942e1c58e23196920daecdd3a13a7f6';
