import 'package:eclipt_stylish/core/base/error.dart';
import 'package:eclipt_stylish/core/base/usecase.dart';
import 'package:eclipt_stylish/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:eclipt_stylish/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:eclipt_stylish/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:eclipt_stylish/features/auth/presentation/providers/current_user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_state_changes_provider.dart';

part 'auth_controller_provider.g.dart';

/// Main authentication state controller - manages auth flows and user state
/// Returns true if user is authenticated, false otherwise
@riverpod
class AuthController extends _$AuthController {
  @override
  Future<bool> build() async {
    // Listen to auth state changes and update accordingly
    ref.listen(authStateChangesProvider, (_, next) {
      next.when(
        data: (user) {
          state = AsyncData(user != null);
        },
        loading: () {},
        error: (error, stack) {
          state = const AsyncData(false);
        },
      );
    });

    // Get initial auth state from stream (not from currentUserProvider)
    try {
      final authState = await ref.watch(authStateChangesProvider.future);
      return authState != null;
    } catch (e) {
      return false;
    }
  }

  /// Sign in with email and password
  /// Throws Error on failure
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final signInUsecase = ref.read(signInUsecaseProvider);
      await signInUsecase.call(
        SignInParams(email: email, password: password),
      );

      // Invalidate to fetch fresh user data
      ref.invalidate(currentUserProvider);

      state = const AsyncData(true);
    } on Error catch (e) {
      state = const AsyncData(false);
      rethrow;
    }
  }

  /// Sign up with email and password
  /// Creates Firebase Auth user and Firestore document
  /// Throws Error on failure
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final signUpUsecase = ref.read(signUpUsecaseProvider);
      await signUpUsecase.call(
        SignUpParams(email: email, password: password),
      );

      // Invalidate to fetch fresh user data
      ref.invalidate(currentUserProvider);

      state = const AsyncData(true);
    } on Error catch (e) {
      state = const AsyncData(false);
      rethrow;
    }
  }

  /// Sign out current user
  /// Throws Error on failure
  Future<void> signOut() async {
    state = const AsyncLoading();

    try {
      final signOutUsecase = ref.read(signOutUsecaseProvider);
      await signOutUsecase.call(NoParams());

      // Invalidate to clear user data
      ref.invalidate(currentUserProvider);

      state = const AsyncData(false);
    } on Error catch (e) {
      state = const AsyncData(false);
      rethrow;
    }
  }
}
