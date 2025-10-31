import 'package:eclipt_stylish/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

/// Provider for current user
@riverpod
Future<UserEntity?> currentUser(Ref ref) async {
  try {
    final repository = ref.watch(authRepositoryProvider);
    final user = await repository.getCurrentUser();
    return user;
  } catch (e) {
    return null;
  }
}
