import 'package:flutter_bloc/flutter_bloc.dart';

import '../../paywall/domain/paywall_usecases.dart';
import 'paywall_state.dart';

class PaywallCubit extends Cubit<PaywallState> {
  final GetSubscriptionStatus _getStatus;
  final SubscribeUseCase _subscribe;
  final UnsubscribeUseCase _unsubscribe;

  PaywallCubit(this._getStatus, this._subscribe, this._unsubscribe)
      : super(const PaywallState()) {
    _load();
  }

  Future<void> _load() async {
    final saved = await _getStatus();
    emit(state.copyWith(isSubscribed: saved));
  }

  Future<void> subscribe() async {
    await _subscribe();
    emit(state.copyWith(isSubscribed: true));
  }

  Future<void> unsubscribe() async {
    await _unsubscribe();
    emit(state.copyWith(isSubscribed: false));
  }
}


