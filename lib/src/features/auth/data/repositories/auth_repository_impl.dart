import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/firebase_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<UserEntity?> login(String email, String password) async {
    final userModel = await _remoteDataSource.loginWithEmailAndPassword(
      email,
      password,
    );
    return userModel?.toEntity();
  }

  @override
  Future<UserEntity?> register(String email, String password) async {
    final userModel = await _remoteDataSource.registerWithEmailAndPassword(
      email,
      password,
    );
    return userModel?.toEntity();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final userModel = await _remoteDataSource.getCurrentUser();
    return userModel?.toEntity();
  }

  @override
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
  }

  @override
  Future<void> updateProfileImage(String profileImage) async {
    await _remoteDataSource.updateProfileImage(profileImage);
  }

  @override
  Future<void> updateProfile(
    String displayName,
    String contactNumber,
    String address,
  ) async {
    await _remoteDataSource.updateProfile(displayName, contactNumber, address);
  }

  @override
  Future<UserEntity?> updateUser(String profileImage) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
