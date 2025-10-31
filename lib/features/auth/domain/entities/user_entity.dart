import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// Pure domain entity representing a user
/// No dependencies on external frameworks
@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String uid,
    required String email,
    String? displayText,
  }) = _UserEntity;
}
