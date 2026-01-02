import '../../../core/services/local_storage_service.dart';

const _kLoggedInKey = 'is_logged_in';

class AuthRepository {
  final LocalStorageService storage;

  const AuthRepository(this.storage);

  Future<bool> getLoggedIn() => storage.getBool(_kLoggedInKey, defaultValue: false);

  Future<void> setLoggedIn(bool value) => storage.setBool(_kLoggedInKey, value);
}


