import 'package:eclipt_stylish/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_changes_provider.g.dart';

/// Provider for auth state changes stream
@riverpod
Stream<UserEntity?> authStateChanges(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.authStateChanges;
}
