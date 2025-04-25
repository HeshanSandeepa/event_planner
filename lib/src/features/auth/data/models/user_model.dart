import '../../domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    String? uid,
    String? email,
    String? firstName,
    String? lastName,
    String? contactNumber,
    String? photoUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      firstName: firstName,
      lastName: lastName,
      contactNumber: contactNumber,
      photoUrl: photoUrl,
    );
  }
}
