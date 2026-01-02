import 'package:shared_preferences/shared_preferences.dart';

const _kLoggedInKey = 'is_logged_in';

class AuthRepository {
  const AuthRepository();

  Future<bool> getLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kLoggedInKey) ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kLoggedInKey, value);
  }
}


