// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Main authentication state controller - manages auth flows and user state
/// Returns true if user is authenticated, false otherwise

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

/// Main authentication state controller - manages auth flows and user state
/// Returns true if user is authenticated, false otherwise
final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, bool> {
  /// Main authentication state controller - manages auth flows and user state
  /// Returns true if user is authenticated, false otherwise
  const AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'7560b73f84968877b265ed7d3d2647ad779b3ea9';

/// Main authentication state controller - manages auth flows and user state
/// Returns true if user is authenticated, false otherwise

abstract class _$AuthController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
