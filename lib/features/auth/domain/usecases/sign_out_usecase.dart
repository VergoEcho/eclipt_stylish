import 'package:eclipt_stylish/core/base/usecase.dart';
import 'package:eclipt_stylish/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:eclipt_stylish/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_usecase.g.dart';

class SignOutUsecase extends UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOutUsecase(this.repository);

  @override
  Future<void> call(NoParams params) async {
    return await repository.signOut();
  }
}

/// Provider for SignOutUsecase
@riverpod
SignOutUsecase signOutUsecase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUsecase(repository);
}
