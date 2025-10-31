import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipt_stylish/core/providers/firebase_providers.dart';
import 'package:eclipt_stylish/features/auth/data/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_remote_datasource.g.dart';

/// Abstract datasource for Firestore user operations
abstract class FirestoreRemoteDatasource {
  /// Create user document in Firestore
  Future<void> createUser(UserModel user);

  /// Get user document from Firestore
  Future<UserModel> getUser(String uid);

  /// Update user document in Firestore
  Future<void> updateUser(String uid, Map<String, dynamic> data);

  /// Stream of user data from Firestore
  Stream<UserModel?> getUserStream(String uid);
}

/// Implementation of FirestoreRemoteDatasource
class FirestoreRemoteDatasourceImpl implements FirestoreRemoteDatasource {
  final FirebaseFirestore firestore;
  static const String usersCollection = 'users';

  FirestoreRemoteDatasourceImpl(this.firestore);

  @override
  Future<void> createUser(UserModel user) async {
    await firestore.collection(usersCollection).doc(user.uid).set(user.toFirestore());
  }

  @override
  Future<UserModel> getUser(String uid) async {
    final doc = await firestore.collection(usersCollection).doc(uid).get();
    if (!doc.exists) {
      throw Exception('User document not found');
    }
    return UserModel.fromFirestore(doc);
  }

  @override
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    // Use set with merge to create document if it doesn't exist
    await firestore.collection(usersCollection).doc(uid).set(
      data,
      SetOptions(merge: true),
    );
  }

  @override
  Stream<UserModel?> getUserStream(String uid) {
    return firestore.collection(usersCollection).doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return UserModel.fromFirestore(doc);
    });
  }
}

/// Provider for FirestoreRemoteDatasource
@riverpod
FirestoreRemoteDatasource firestoreRemoteDatasource(Ref ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return FirestoreRemoteDatasourceImpl(firestore);
}
