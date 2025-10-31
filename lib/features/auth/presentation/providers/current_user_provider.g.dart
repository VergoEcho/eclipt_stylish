// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for current user

@ProviderFor(currentUser)
const currentUserProvider = CurrentUserProvider._();

/// Provider for current user

final class CurrentUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserEntity?>,
          UserEntity?,
          FutureOr<UserEntity?>
        >
    with $FutureModifier<UserEntity?>, $FutureProvider<UserEntity?> {
  /// Provider for current user
  const CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $FutureProviderElement<UserEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserEntity?> create(Ref ref) {
    return currentUser(ref);
  }
}

String _$currentUserHash() => r'c6e2faa2aef338b4de7d84f14a4a786ed430a243';
