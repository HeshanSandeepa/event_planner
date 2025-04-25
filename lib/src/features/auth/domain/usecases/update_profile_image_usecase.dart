import '../repositories/auth_repository.dart';

class UpdateProfileImageUseCase {
  final AuthRepository authRepository;

  UpdateProfileImageUseCase({required this.authRepository});

  Future<void> execute(String imagePath) async {
    return await authRepository.updateProfileImage(imagePath);
  }
}
