import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class UpdateProfileUseCase {
  final AuthRepository authRepository;

  UpdateProfileUseCase({required this.authRepository});

  Future<void> execute(
    String displayName,
    String contactNumber,
    String address,
  ) async {
    return await authRepository.updateProfile(
      displayName,
      contactNumber,
      address,
    );
  }
}
