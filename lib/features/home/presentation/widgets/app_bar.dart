// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isCarrito;

  const CustomAppBar({super.key, this.isCarrito = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131.h,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.appBarShadowColor, // #0000001A
            offset: Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: isCarrito
          ? AppBar(
              title: const Text(
                AppStrings.cartTitle,
                style: AppTextStyle.headerStyle,
              ),
            )
          : AppBar(
              title: const Text(
                AppStrings.inicio,
                style: AppTextStyle.headerStyle,
              ),
              centerTitle: false,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 33.81.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.alarmIcon,
                        width: 19.44.w,
                        height: 22.19.h,
                      ),
                      horizontalSpace(AppSize.s16.w), // Approx 15.56
                      SvgPicture.asset(
                        AppImages.prenectgaIcon,
                        width: 21.2.w,
                        height: 21.19.h,
                      ),
                    ],
                  ),
                ),
              ],
              leadingWidth: 132.w,
              toolbarHeight: 131.h,
              leading: Padding(
                padding: EdgeInsets.only(
                  left: 12.16.w,
                  top: 10.76.h,
                  bottom: 10.76.h,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 12.16.w,
                      top: 10.76.h,
                      bottom: 10.76.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: AppColor.buscarColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: AppColor.buscarColor,
                        width: 1,
                      ),
                    ),
                    hintText: AppStrings.buscar,
                    hintStyle: AppTextStyle.buscarStyle,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 12.16.w, right: 8.0.w),
                      child: SvgPicture.asset(
                        AppImages.searchIcon,
                        width: 13.15.w,
                        height: 13.15.h,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(131.h);
}
