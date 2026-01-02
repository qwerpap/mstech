import '../data/auth_repository.dart';

class GetAuthStatus {
  final AuthRepository repository;
  GetAuthStatus(this.repository);

  Future<bool> call() => repository.getLoggedIn();
}

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<void> call() => repository.setLoggedIn(true);
}

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);

  Future<void> call() => repository.setLoggedIn(false);
}


