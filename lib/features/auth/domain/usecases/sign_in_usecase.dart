import 'package:eclipt_stylish/core/base/usecase.dart';
import 'package:eclipt_stylish/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';
import 'package:eclipt_stylish/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_usecase.g.dart';

class SignInUsecase extends UseCase<UserEntity, SignInParams> {
  final AuthRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<UserEntity> call(SignInParams params) async {
    return await repository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}

/// Provider for SignInUsecase
@riverpod
SignInUsecase signInUsecase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUsecase(repository);
}
