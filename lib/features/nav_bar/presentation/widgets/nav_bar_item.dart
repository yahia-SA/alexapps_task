import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/core/constants/nav_bar_constants.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/features/nav_bar/data/models/nav_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.navItem,
    required this.isSelected,
    required this.onTap,
  });
  final NavItem navItem;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: _buildIcon(),
    );
  }

  Widget _buildIcon() {
    if (navItem.iconPath == AppImages.basketIcon) {
      return _buildBasketIcon();
    }

    if (navItem.iconPath == AppImages.profileIcon) {
      return _buildProfileIcon();
    }

    return _buildStandardIcon();
  }

  Widget _buildBasketIcon() {
    return Container(
      width: NavBarConstants.basketIconSizeWhite.w,
      height: NavBarConstants.basketIconSizeWhite.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor,
            offset: Offset(0, 0),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        width: NavBarConstants.basketIconSize.w,
        height: NavBarConstants.basketIconSize.h,
        decoration: const BoxDecoration(
          color: AppColor.headerColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            navItem.iconPath,
            width: navItem.width.w,
            height: navItem.height.h,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileIcon() {
    return Container(
      width: navItem.width.w,
      height: navItem.height.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(navItem.iconPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildStandardIcon() {
    return SvgPicture.asset(
      navItem.iconPath,
      width: navItem.width.w,
      height: navItem.height.h,
    );
  }
}
