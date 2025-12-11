import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryAddressSelector extends StatelessWidget {
  const DeliveryAddressSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAddressCard(
          context,
          icon: AppImages.homeIcon,
          title: AppStrings.myHome,
          subtitle: AppStrings.exampleAddress,
          isSelected: true,
        ),
        horizontalSpace(AppSize.s16.w),
        _buildAddressCard(
          context,
          icon: AppImages.homeIcon,
          title: AppStrings.myWork,
          subtitle: AppStrings.exampleAddress,
          isSelected: false,
        ),
        horizontalSpace(10.w),
        Container(
          width: 50.w,
          height: 50.h,
          decoration: const BoxDecoration(
            color: AppColor.headerColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(CupertinoIcons.add, color: AppColor.white),
        ),
      ],
    );
  }

  Widget _buildAddressCard(
    BuildContext context, {
    required String icon,
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return Expanded(
      // Use Expanded to share width equally or flexible
      child: Container(
        height: 50.31.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.headerColor : AppColor.white,
          borderRadius: BorderRadius.circular(
            20.r,
          ), // slightly less rounded than pills
          border: isSelected ? null : Border.all(color: AppColor.buscarColor),
          boxShadow: isSelected ? [] : [],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: isSelected
                  ? AppColor.white
                  : AppColor.headerColor, // Purple icon when not selected
              width: 18.38.w,
              height: 19.52.h,
            ),
            horizontalSpace(AppSize.s8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColor.white
                          : AppColor.secondColror,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: isSelected
                          ? AppColor.white.withOpacity(0.8)
                          : AppColor.grayColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
