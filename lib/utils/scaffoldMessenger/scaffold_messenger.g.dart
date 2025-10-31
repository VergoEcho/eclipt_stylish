// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scaffold_messenger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A service to show SnackBars using the ScaffoldMessenger.
/// It provides a simple interface to display messages with different types
/// Pass different kinds of SnackBarType ([success], [warning], [error], [info])
/// to customize it appearance.
///
/// Accessible everywhere in the app via [scaffoldMessengerServiceProvider]
/// or context extension [context.showSnackBar()].

@ProviderFor(ScaffoldMessengerService)
const scaffoldMessengerServiceProvider = ScaffoldMessengerServiceProvider._();

/// A service to show SnackBars using the ScaffoldMessenger.
/// It provides a simple interface to display messages with different types
/// Pass different kinds of SnackBarType ([success], [warning], [error], [info])
/// to customize it appearance.
///
/// Accessible everywhere in the app via [scaffoldMessengerServiceProvider]
/// or context extension [context.showSnackBar()].
final class ScaffoldMessengerServiceProvider
    extends
        $NotifierProvider<
          ScaffoldMessengerService,
          GlobalKey<ScaffoldMessengerState>
        > {
  /// A service to show SnackBars using the ScaffoldMessenger.
  /// It provides a simple interface to display messages with different types
  /// Pass different kinds of SnackBarType ([success], [warning], [error], [info])
  /// to customize it appearance.
  ///
  /// Accessible everywhere in the app via [scaffoldMessengerServiceProvider]
  /// or context extension [context.showSnackBar()].
  const ScaffoldMessengerServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scaffoldMessengerServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scaffoldMessengerServiceHash();

  @$internal
  @override
  ScaffoldMessengerService create() => ScaffoldMessengerService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<ScaffoldMessengerState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<ScaffoldMessengerState>>(
        value,
      ),
    );
  }
}

String _$scaffoldMessengerServiceHash() =>
    r'f549e4fec2b8310deb100baa45936453f5c58da1';

/// A service to show SnackBars using the ScaffoldMessenger.
/// It provides a simple interface to display messages with different types
/// Pass different kinds of SnackBarType ([success], [warning], [error], [info])
/// to customize it appearance.
///
/// Accessible everywhere in the app via [scaffoldMessengerServiceProvider]
/// or context extension [context.showSnackBar()].

abstract class _$ScaffoldMessengerService
    extends $Notifier<GlobalKey<ScaffoldMessengerState>> {
  GlobalKey<ScaffoldMessengerState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              GlobalKey<ScaffoldMessengerState>,
              GlobalKey<ScaffoldMessengerState>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                GlobalKey<ScaffoldMessengerState>,
                GlobalKey<ScaffoldMessengerState>
              >,
              GlobalKey<ScaffoldMessengerState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
