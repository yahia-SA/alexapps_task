import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/extensions/string_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:alexapps_task/features/home/presentation/cubit/favorite_cubit.dart';
import 'package:alexapps_task/features/product_detail/presentation/widgets/ingredient_item.dart';
import 'package:alexapps_task/features/product_detail/presentation/widgets/bottom_order_bar.dart';
import 'package:alexapps_task/injection_container.dart';
import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, this.favoriteCubit});
  final FavoriteCubit? favoriteCubit;

  @override
  Widget build(BuildContext context) {
    // Hardcoded data for this specific task
    const String productId = 'hamburguesa_special';

    return Scaffold(
      body: Stack(
        children: [
          // Header Background and Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 0.45.sh,
            child: Container(
              color: AppColor
                  .darkBackgroundColor, // Dark background matching design
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppImages
                          .bigBurger, // Using black burger to match dark theme look
                      fit: BoxFit.cover,
                    ),
                  ),
                  // App Bar / Back Button
                  Positioned(
                    top: 50.h,
                    left: 20.w,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55.h,
                    left: 0,
                    right: 0,
                    child: const Center(
                      child: Text(
                        AppStrings.productTitle,
                        style: AppTextStyle.whiteTitleStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // White Body Content
          Positioned(
            top: 0.40.sh,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                24.w,
                40.h,
                24.w,
                0,
              ), // Top padding for FAB space
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.descriptionTitle,
                    style: AppTextStyle.mediumTitleStyle,
                  ),
                  verticalSpace(AppSize.s4.h),
                  const Text(
                    AppStrings.descriptionText,
                    style: AppTextStyle.descriptionStyle,
                  ),
                  verticalSpace(16.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.ingredientsTitle,
                        style: AppTextStyle.mediumTitleStyle,
                      ),
                      Text(
                        AppStrings.ingredientsCount,
                        style: AppTextStyle.grayCounterStyle,
                      ),
                    ],
                  ),
                  verticalSpace(16.h),
                  // Ingredients List
                  SizedBox(
                    height: 139.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const IngredientItem(
                          name: 'Arrachera',
                          image: AppImages.meat,
                        ),
                        horizontalSpace(16.w),
                        const IngredientItem(
                          name: 'Pan ajonjolí',
                          image: AppImages.breads,
                        ),
                        horizontalSpace(16.w),
                        const IngredientItem(
                          name: 'Lechuga',
                          image: AppImages.lechuga,
                        ),
                        horizontalSpace(16.w),
                        const IngredientItem(
                          name: 'Cebolla',
                          image: AppImages.cebolla,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  BottomOrderBar(price: AppStrings.price.toDouble()),
                  verticalSpace(20.h),
                ],
              ),
            ),
          ),
          // Floating Action Button (Favorite)
          Positioned(
            top: 0.40.sh - 28.h, // Half of FAB height (56/2)
            right: 30.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: favoriteCubit != null
                  ? BlocProvider.value(
                      value: favoriteCubit!,
                      child: BlocBuilder<FavoriteCubit, bool>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              context.read<FavoriteCubit>().toggle();
                            },
                            child: Container(
                              width: 48.06.w,
                              height: 48.06.h,
                              decoration: BoxDecoration(
                                color: state
                                    ? AppColor.fillHart
                                    : AppColor.hart,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : BlocProvider(
                      create: (context) => sl<FavoriteCubit>(param1: productId),
                      child: BlocBuilder<FavoriteCubit, bool>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              context.read<FavoriteCubit>().toggle();
                            },
                            child: Container(
                              width: 48.06.w,
                              height: 48.06.h,
                              decoration: BoxDecoration(
                                color: state
                                    ? AppColor.fillHart
                                    : AppColor.hart,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite_border,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
