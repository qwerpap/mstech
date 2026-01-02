import 'package:equatable/equatable.dart';

class PaywallState extends Equatable {
  final bool isSubscribed;

  const PaywallState({this.isSubscribed = false});

  PaywallState copyWith({bool? isSubscribed}) {
    return PaywallState(isSubscribed: isSubscribed ?? this.isSubscribed);
  }

  @override
  List<Object?> get props => [isSubscribed];
}


