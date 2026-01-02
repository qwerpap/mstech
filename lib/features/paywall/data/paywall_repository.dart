import 'package:shared_preferences/shared_preferences.dart';

const _kSubscriptionKey = 'is_subscribed';

class PaywallRepository {
  const PaywallRepository();

  Future<bool> getSubscription() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kSubscriptionKey) ?? false;
  }

  Future<void> setSubscription(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kSubscriptionKey, value);
  }
}


