import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<UserEntity?> execute(String email, String password) async {
    return await _authRepository.register(email, password);
  }
}
