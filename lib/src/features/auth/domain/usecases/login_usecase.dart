import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<UserEntity?> execute(String email, String password) async {
    return await _authRepository.login(email, password);
  }
}
