import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class NavigationItem extends Equatable {
  final IconData icon;
  final String label;
  final String route;

  const NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  List<Object> get props => [icon.codePoint, label, route];
}

