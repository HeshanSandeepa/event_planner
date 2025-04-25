import '../entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity?> login(String email, String password);
  Future<UserEntity?> register(String email, String password);
  Future<UserEntity?> updateUser(String profileImage);
  Future<UserEntity?> getCurrentUser();
  Future<void> updateProfileImage(String profileImage);
  Future<void> updateProfile(
    String displayName,
    String contactNumber,
    String address,
  );
  Future<void> signOut();
}
