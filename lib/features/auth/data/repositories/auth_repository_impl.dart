import 'package:eclipt_stylish/core/base/repository.dart';
import 'package:eclipt_stylish/features/auth/data/datasources/firebase_auth_remote_datasource.dart';
import 'package:eclipt_stylish/features/auth/data/datasources/firestore_remote_datasource.dart';
import 'package:eclipt_stylish/features/auth/data/models/user_model.dart';
import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';
import 'package:eclipt_stylish/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

/// Implementation of AuthRepository
/// Uses BaseRepository mixin for error handling
class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  final FirebaseAuthRemoteDatasource authDatasource;
  final FirestoreRemoteDatasource firestoreDatasource;

  AuthRepositoryImpl({
    required this.authDatasource,
    required this.firestoreDatasource,
  });

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async => handleRequest(() async {
      final firebaseUser = await authDatasource.signInWithEmail(email, password);
      final userModel = await firestoreDatasource.getUser(firebaseUser.uid);
      return userModel.toEntity();
    });

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {
    return handleRequest(() async {
      // Create Firebase Auth user
      final firebaseUser = await authDatasource.signUpWithEmail(email, password);

      // Create Firestore user document
      final userModel = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email!,
        displayText: null, // Will be set in account setup
      );
      await firestoreDatasource.createUser(userModel);

      return userModel.toEntity();
    });
  }

  @override
  Future<void> signOut() async {
    return handleRequest(() async {
      await authDatasource.signOut();
    });
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    return handleRequest(() async {
      final firebaseUser = authDatasource.getCurrentUser();
      if (firebaseUser == null) return null;

      final userModel = await firestoreDatasource.getUser(firebaseUser.uid);
      return userModel.toEntity();
    });
  }

  @override
  Future<UserEntity> getUserData(String uid) async {
    return handleRequest(() async {
      final userModel = await firestoreDatasource.getUser(uid);
      return userModel.toEntity();
    });
  }

  @override
  Future<void> updateUserData({
    required String uid,
    required String displayText,
  }) async {
    return handleRequest(() async {
      await firestoreDatasource.updateUser(uid, {'displayText': displayText});
    });
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return authDatasource.authStateChanges.asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return null;
      }
      try {
        final userModel = await firestoreDatasource.getUser(firebaseUser.uid);
        return userModel.toEntity();
      } catch (e) {
        return null;
      }
    });
  }

  @override
  Stream<UserEntity?> getUserDataStream(String uid) {
    return firestoreDatasource.getUserStream(uid).map((user) => user?.toEntity());
  }
}

/// Provider for AuthRepository implementation
@riverpod
AuthRepository authRepository(Ref ref) {
  final authDatasource = ref.watch(firebaseAuthRemoteDatasourceProvider);
  final firestoreDatasource = ref.watch(firestoreRemoteDatasourceProvider);

  return AuthRepositoryImpl(
    authDatasource: authDatasource,
    firestoreDatasource: firestoreDatasource,
  );
}
