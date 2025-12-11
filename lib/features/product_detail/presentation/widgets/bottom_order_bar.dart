import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomOrderBar extends StatelessWidget {
  const BottomOrderBar({super.key, required this.price});
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 20.h),
      decoration: const BoxDecoration(color: AppColor.white),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                gradient: const LinearGradient(
                  colors: [
                    AppColor.linearGradientFirstColor,
                    AppColor.linearGradientSecondColor,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: const Text(
                  AppStrings.orderNowButton,
                  style: AppTextStyle.orderNowButton,
                ),
              ),
            ),
          ),
          horizontalSpace(AppSize.s20.w),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: AppTextStyle.priceTextStyle30,
          ),
        ],
      ),
    );
  }
}
