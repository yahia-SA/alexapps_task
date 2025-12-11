import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSummaryWidget extends StatelessWidget {
  const CartSummaryWidget({
    super.key,
    required this.subtotal,
    required this.total,
  });

  final double subtotal;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColor.lighyGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.subtotalLabel,
                style: AppTextStyle.totalStyle,
              ),
              Text(
                '\$${subtotal.toStringAsFixed(2)} ${AppStrings.currency}',
                style: AppTextStyle.currencyStyle,
              ),
            ],
          ),
          verticalSpace(8.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.shippingLabel, style: AppTextStyle.totalStyle),
              Text(AppStrings.free, style: AppTextStyle.currencyStyle),
            ],
          ),
          verticalSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.totalLabel,
                style: AppTextStyle.headerStyle17,
              ),
              Text(
                '\$${total.toStringAsFixed(2)} ${AppStrings.currency}',
                style: AppTextStyle.headerStyle17,
              ),
            ],
          ),
          verticalSpace(24.h),

          // Realizar compra button
          SizedBox(
            width: double.infinity,
            height: 63.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: const LinearGradient(
                  colors: [
                    AppColor.linearGradientFirstColor,
                    AppColor.linearGradientSecondColor,
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: const Text(
                  AppStrings.checkoutButton,
                  style: AppTextStyle.orderNowButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
