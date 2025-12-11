import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/features/nav_bar/data/models/nav_bar_model.dart';

class NavBarConstants {
  static const List<NavItem> navItems = [
    NavItem(
      iconPath: AppImages.homeIcon,
      label: 'Home',
      width: 17.93,
      height: 19.04,
    ),
    NavItem(
      iconPath: AppImages.shopIcon,
      label: 'Shop',
      width: 19.19,
      height: 19.19,
    ),
    NavItem(
      iconPath: AppImages.basketIcon,
      label: 'Basket',
      width: 27.61,
      height: 22.77,
      isSpecialIcon: true,
    ),
    NavItem(
      iconPath: AppImages.favoritesIcon,
      label: 'Favorites',
      width: 20.23,
      height: 18.34,
    ),
    NavItem(
      iconPath: AppImages.profileIcon,
      label: 'Profile',
      width: 23,
      height: 23,
      isSpecialIcon: true,
    ),
  ];

  static const double navBarHeight = 68;
  static const double horizontalPadding = 23;
  static const double bottomMargin = 28;
  static const double basketIconSize = 54;
  static const double basketIconSizeWhite = 99;
}
