import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/wishlist_item.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void addWishlist(WishlistItem item) {
    final updated = List<WishlistItem>.from(state.items)..add(item);
    emit(state.copyWith(items: updated));
  }
}

