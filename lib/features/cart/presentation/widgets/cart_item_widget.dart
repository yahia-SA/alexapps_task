import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:alexapps_task/features/cart/domain/entities/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 289.h,
      width: 236.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColor.lightShadowColor,
            offset: Offset(0, 10),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSize.s40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image
                Container(
                  width: 95.w,
                  height: 95.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.grey.shade100, // Background for image
                  ),
                  child: ClipOval(
                    child: item.product.imagePath.endsWith('.svg')
                        ? SvgPicture.asset(item.product.imagePath)
                        : Image.asset(
                            item.product.imagePath,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                verticalSpace(AppSize.s11.h),
                // Details
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s30.w),
                    child: Column(
                      children: [
                        Text(
                          item.product.name,
                          style: AppTextStyle.titleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpace(AppSize.s6.h),
                        Text(
                          item.product.subName,
                          style: AppTextStyle.poppins300_9,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpace(8.h),
                        Row(
                          children: [
                            _buildQtyButton(
                              icon: Icons.remove,
                              onTap: onDecrement,
                              color: const Color(0xffF3F3F3),
                              iconColor: const Color(0xff949494),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                              child: Text(
                                '${item.quantity}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            _buildQtyButton(
                              icon: CupertinoIcons.add,
                              onTap: onIncrement,
                              color: AppColor.headerColor,
                              iconColor: AppColor.white,
                            ),
                            horizontalSpace(AppSize.s26.w),
                            Text(
                              '\$${item.product.cost.toStringAsFixed(0)}',
                              style: AppTextStyle.priceTextStyle20,
                            ),
                            horizontalSpace(8.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Delete Button (Top Right)
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: onRemove,
              icon: Container(
                width: 41.w,
                height: 41.h,
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  color: AppColor.fillHart, // Red color
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.delete_solid,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 22.w,
        height: 22.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: iconColor, size: 16.sp),
      ),
    );
  }
}
