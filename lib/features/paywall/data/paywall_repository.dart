import '../../../core/services/local_storage_service.dart';

const _kSubscriptionKey = 'is_subscribed';

class PaywallRepository {
  final LocalStorageService storage;

  const PaywallRepository(this.storage);

  Future<bool> getSubscription() => storage.getBool(_kSubscriptionKey, defaultValue: false);

  Future<void> setSubscription(bool value) => storage.setBool(_kSubscriptionKey, value);
}


