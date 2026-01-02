import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/domain/auth_usecases.dart';

class AuthCubit extends Cubit<bool> {
  final GetAuthStatus _getStatus;
  final LoginUseCase _login;
  final LogoutUseCase _logout;

  AuthCubit(this._getStatus, this._login, this._logout) : super(false) {
    _load();
  }

  Future<void> _load() async {
    final saved = await _getStatus();
    emit(saved);
  }

  Future<void> login() async {
    await _login();
    emit(true);
  }

  Future<void> logout() async {
    await _logout();
    emit(false);
  }
}


