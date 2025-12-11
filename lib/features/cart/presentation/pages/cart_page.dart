import 'package:alexapps_task/core/constants/app_sizes.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alexapps_task/features/cart/presentation/cubit/cart_state.dart';
import 'package:alexapps_task/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:alexapps_task/features/cart/presentation/widgets/cart_summary_widget.dart';
import 'package:alexapps_task/features/cart/presentation/widgets/delivery_address_selector.dart';
import 'package:alexapps_task/features/home/presentation/widgets/app_bar.dart';
import 'package:alexapps_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartCubit>()..loadCart(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return const Center(child: Text('Your cart is empty'));
            }
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: const CustomAppBar(isCarrito: true),
              body: Column(
                children: [
                  verticalSpace(AppSize.s20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: const DeliveryAddressSelector(),
                  ),
                  verticalSpace(AppSize.s30.h),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            itemCount: state.items.length,
                            separatorBuilder: (context, index) =>
                                horizontalSpace(AppSize.s24.w),
                            itemBuilder: (context, index) {
                              final item = state.items[index];
                              return CartItemWidget(
                                item: item,
                                onIncrement: () {
                                  context.read<CartCubit>().updateQuantity(
                                    item.product.id,
                                    item.quantity + 1,
                                  );
                                },
                                onDecrement: () {
                                  context.read<CartCubit>().updateQuantity(
                                    item.product.id,
                                    item.quantity - 1,
                                  );
                                },
                                onRemove: () {
                                  context.read<CartCubit>().removeItem(
                                    item.product.id,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        CartSummaryWidget(
                          subtotal: state.subtotal,
                          total: state.total,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
