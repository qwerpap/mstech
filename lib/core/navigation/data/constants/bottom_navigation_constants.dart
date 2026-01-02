import '../models/navigation_item.dart';
import 'navigation_constants.dart';
import 'navigation_icons.dart';
import 'navigation_labels.dart';

class BottomNavigationConstants {
  BottomNavigationConstants._();

  static const List<NavigationItem> navigationItems = [
    NavigationItem(
      icon: NavigationIcons.home,
      label: NavigationLabels.home,
      route: NavigationConstants.home,
    ),
    NavigationItem(
      icon: NavigationIcons.favourites,
      label: NavigationLabels.favourites,
      route: NavigationConstants.favourites,
    ),
    NavigationItem(
      icon: NavigationIcons.notifications,
      label: NavigationLabels.notifications,
      route: NavigationConstants.notifications,
    ),
    NavigationItem(
      icon: NavigationIcons.profile,
      label: NavigationLabels.profile,
      route: NavigationConstants.profile,
    ),
  ];
}

