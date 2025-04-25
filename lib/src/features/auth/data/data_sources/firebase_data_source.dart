import '../models/user_model.dart';

abstract class FirebaseDataSource {
  Future<UserModel?> loginWithEmailAndPassword(String email, String password);
  Future<UserModel?> registerWithEmailAndPassword(
    String email,
    String password,
  );
  Future<UserModel?> getCurrentUser();
  Future<void> updateProfile(
    String displayName,
    String contactNumber,
    String address,
  );
  Future<void> updateProfileImage(String profileImage);
  Future<void> signOut();
}
