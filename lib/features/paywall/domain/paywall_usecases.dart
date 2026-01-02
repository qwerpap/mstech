import '../data/paywall_repository.dart';

class GetSubscriptionStatus {
  final PaywallRepository repository;
  GetSubscriptionStatus(this.repository);

  Future<bool> call() => repository.getSubscription();
}

class SubscribeUseCase {
  final PaywallRepository repository;
  SubscribeUseCase(this.repository);

  Future<void> call() => repository.setSubscription(true);
}

class UnsubscribeUseCase {
  final PaywallRepository repository;
  UnsubscribeUseCase(this.repository);

  Future<void> call() => repository.setSubscription(false);
}


