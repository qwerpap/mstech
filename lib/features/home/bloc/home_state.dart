import 'package:equatable/equatable.dart';

import '../data/models/wishlist_item.dart';

class HomeState extends Equatable {
  final List<WishlistItem> items;

  const HomeState({this.items = const []});

  bool get hasItems => items.isNotEmpty;

  HomeState copyWith({
    List<WishlistItem>? items,
  }) {
    return HomeState(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}

