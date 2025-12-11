import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:alexapps_task/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCategorias extends StatelessWidget {
  const AppCategorias({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppSize.s64.w,
          height: AppSize.s64.h,
          margin: EdgeInsets.only(left: AppSize.s19.w),
          decoration: BoxDecoration(
            color: category.backgorundColor.withOpacity(.45),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(child: SvgPicture.asset(category.iconPath)),
        ),
        verticalSpace(AppSize.s18.h),
        Padding(
          padding: EdgeInsets.only(left: AppSize.s21.w),
          child: Text(category.name, style: AppTextStyle.secondTitleStyle),
        ),
      ],
    );
  }
}
