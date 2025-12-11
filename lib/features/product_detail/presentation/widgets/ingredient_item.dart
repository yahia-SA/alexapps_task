import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 91.w,
          height: 104.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        verticalSpace(AppSize.s19.h),
        Text(
          name,
          style: AppTextStyle.naturalesTextStyle.copyWith(
            color: AppColor.grayColor,
          ),
        ),
      ],
    );
  }
}
