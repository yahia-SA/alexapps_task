import 'package:alexapps_task/core/constants/nav_bar_constants.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';
import 'package:alexapps_task/features/nav_bar/presentation/cubit/nav_bar_state.dart';
import 'package:alexapps_task/features/nav_bar/presentation/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Container(
          height: NavBarConstants.navBarHeight.h,
          margin: EdgeInsets.only(
            left: NavBarConstants.horizontalPadding.w,
            right: NavBarConstants.horizontalPadding.w,
            bottom: NavBarConstants.bottomMargin.h,
          ),
          decoration: _buildNavBarDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildNavItems(context, state.selectedIndex),
          ),
        );
      },
    );
  }

  BoxDecoration _buildNavBarDecoration() {
    return const BoxDecoration(
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          color: AppColor.shadowColor,
          blurRadius: 15,
          spreadRadius: 0,
          offset: Offset.zero,
        ),
      ],
    );
  }

  List<Widget> _buildNavItems(BuildContext context, int selectedIndex) {
    return NavBarConstants.navItems.asMap().entries.map((entry) {
      final index = entry.key;
      final navItem = entry.value;

      return NavBarItem(
        navItem: navItem,
        isSelected: selectedIndex == index,
        onTap: () => context.read<NavBarCubit>().changeIndex(index),
      );
    }).toList();
  }
}
