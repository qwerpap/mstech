import 'package:equatable/equatable.dart';

class WishlistItem extends Equatable {
  final String name;
  final int wishes;

  const WishlistItem({
    required this.name,
    required this.wishes,
  });

  @override
  List<Object?> get props => [name, wishes];
}

