import 'package:eclipt_stylish/core/providers/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_remote_datasource.g.dart';

/// Abstract datasource for Firebase Authentication operations
abstract class FirebaseAuthRemoteDatasource {
  /// Sign in with email and password
  Future<User> signInWithEmail(String email, String password);

  /// Sign up with email and password
  Future<User> signUpWithEmail(String email, String password);

  /// Sign out current user
  Future<void> signOut();

  /// Get current Firebase user
  User? getCurrentUser();

  /// Stream of Firebase auth state changes
  Stream<User?> get authStateChanges;
}

/// Implementation of FirebaseAuthRemoteDatasource
class FirebaseAuthRemoteDatasourceImpl implements FirebaseAuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthRemoteDatasourceImpl(this.firebaseAuth);

  @override
  Future<User> signInWithEmail(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  @override
  Future<User> signUpWithEmail(String email, String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  @override
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
}

/// Provider for FirebaseAuthRemoteDatasource
@riverpod
FirebaseAuthRemoteDatasource firebaseAuthRemoteDatasource(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return FirebaseAuthRemoteDatasourceImpl(firebaseAuth);
}
