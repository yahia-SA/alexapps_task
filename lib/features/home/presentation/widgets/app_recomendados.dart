import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:alexapps_task/features/home/presentation/cubit/favorite_cubit.dart';
import 'package:alexapps_task/injection_container.dart';
import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alexapps_task/features/home/presentation/widgets/favorite_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppRecomendados extends StatelessWidget {
  const AppRecomendados({
    super.key,
    required this.item,
    this.category = 'Naturales', // Default or passed
  });

  final Product item;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w, // Approximate width based on ratio
      height: 104.h, // Approximate height
      margin: EdgeInsets.only(right: 16.w, bottom: 10.h),
      // padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 20,
            spreadRadius: 0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              // Image Section
              SizedBox(
                width: 98.w,
                child: Center(
                  child: item.imagePath.endsWith('.svg')
                      ? SvgPicture.asset(
                          item.imagePath,
                          height: 132.h,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          item.imagePath,
                          height: 132.h,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              // Content Section
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 17.h,
                    right: 15.w,
                    bottom: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Category Label
                      Text(category, style: AppTextStyle.naturalesTextStyle),
                      verticalSpace(AppSize.s12.h),
                      // Product Name
                      Text(
                        item.name,
                        style: AppTextStyle.firstTextStyle.copyWith(
                          fontSize: 10.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // verticalSpace(7),
                      // Subtitle
                      Text(
                        item.subName,
                        style: AppTextStyle.secondTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(AppSize.s8.h),
                      // Price and Arrow
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${item.cost}',
                            style: AppTextStyle.priceTextStyle.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                          Container(
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
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.primaryColor,
                              size: 8.49.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Favorite Icon (Top Right)
          Positioned(
            top: 16.54.h,
            right: 18.68.w,
            child: BlocProvider(
              create: (context) => sl<FavoriteCubit>(param1: item.id),
              child: const FavoriteIcon(isProductFavorite: false),
            ),
          ),
        ],
      ),
    );
  }
}
