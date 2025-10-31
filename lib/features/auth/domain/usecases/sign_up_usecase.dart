import 'package:eclipt_stylish/core/base/usecase.dart';
import 'package:eclipt_stylish/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';
import 'package:eclipt_stylish/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_usecase.g.dart';

class SignUpUsecase extends UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpUsecase(this.repository);

  @override
  Future<UserEntity> call(SignUpParams params) async {
    return await repository.signUp(
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({
    required this.email,
    required this.password,
  });
}

/// Provider for SignUpUsecase
@riverpod
SignUpUsecase signUpUsecase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUsecase(repository);
}
