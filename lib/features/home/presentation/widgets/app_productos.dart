import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:alexapps_task/features/home/presentation/cubit/favorite_cubit.dart';
import 'package:alexapps_task/features/home/presentation/widgets/favorite_icon.dart';
import 'package:alexapps_task/injection_container.dart';
import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppProductos extends StatelessWidget {
  const AppProductos({super.key, required this.item, this.onTap});
  final Product item;
  final void Function(BuildContext)? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteCubit>(param1: item.id),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => onTap?.call(context),
            child: Stack(
              children: [
                Container(
                  width: 174.w,
                  height: 214.h,
                  padding: EdgeInsets.only(left: 19.0.w, right: 15.0.w),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColor.lightShadowColor,
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heart icon
                      Padding(
                        padding: EdgeInsets.only(right: 5.0.w, top: 8.0.h),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [FavoriteIcon(isProductFavorite: true)],
                        ),
                      ),
                      // Product image with circular decoration and blue glow
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Static shadow/glow background
                            Container(
                              width: 90.w,
                              height: 90.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.blueOpacity03,
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                            // Image
                            Container(
                              width: 90.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.white,
                                border: Border.all(
                                  color: AppColor.white,
                                  width: 8.w,
                                ),
                              ),
                              child: ClipOval(
                                child: item.imagePath.endsWith('.svg')
                                    ? SvgPicture.asset(
                                        item.imagePath,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        item.imagePath,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(AppSize.s33.h),
                      // Product name
                      Text(item.name, style: AppTextStyle.firstTextStyle),
                      // Product subtitle
                      Text(item.subName, style: AppTextStyle.secondTextStyle),

                      // Product price
                      Text(
                        '\$${item.cost}',
                        style: AppTextStyle.priceTextStyle,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 15.w,
                  top: 173.h,
                  child: Container(
                    width: 29.w,
                    height: 29.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                          blurRadius: 15,
                          spreadRadius: 0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.primaryColor,
                      size: 8.49.sp, // Maching height
                    ),
                  ),
                ),
                verticalSpace(AppSize.s7.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
