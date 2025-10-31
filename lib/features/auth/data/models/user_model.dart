import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclipt_stylish/features/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Data model for User with JSON serialization
/// Implements domain entity and adds data layer concerns
@freezed
sealed class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String uid,
    required String email,
    String? displayText,
  }) = _UserModel;

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Create UserModel from Firestore DocumentSnapshot
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      email: data['email'] as String,
      displayText: data['displayText'] as String?,
    );
  }

  /// Convert UserModel to Firestore document data
  /// Excludes uid as it's stored as document ID
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayText': displayText,
    };
  }

  /// Convert UserModel to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      displayText: displayText,
    );
  }

  /// Create UserModel from UserEntity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      displayText: entity.displayText,
    );
  }
}
