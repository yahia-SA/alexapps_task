import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/features/home/presentation/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.isProductFavorite});
  final bool isProductFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, bool>(
      builder: (context, isFavorite) {
        return GestureDetector(
          onTap: () {
            context.read<FavoriteCubit>().toggle();
          },
          child: Padding(
            padding: EdgeInsets.all(8.0.r), // Padding for touch area
            child: SizedBox(
              width: isProductFavorite ? 15.59.w : 12.16.w,
              height: isProductFavorite ? 14.13.h : 10.68.h,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? AppColor.fillHart : AppColor.hart,
                size: !isProductFavorite ? 14.13.sp : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
