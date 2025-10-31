import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';


abstract class AuthRepository {
  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<UserEntity> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserEntity?> getCurrentUser();

  Future<UserEntity> getUserData(String uid);

  Future<void> updateUserData({
    required String uid,
    required String displayText,
  });

  /// Stream of authentication state changes
  Stream<UserEntity?> get authStateChanges;

  /// Stream of user data from Firestore
  Stream<UserEntity?> getUserDataStream(String uid);
}
