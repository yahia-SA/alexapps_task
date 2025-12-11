import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/constants/categorias_constants.dart';
import 'package:alexapps_task/core/extensions/sizedbox_extensions.dart';
import 'package:alexapps_task/core/theme/app_text_sytle.dart';
import 'package:alexapps_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:alexapps_task/features/home/presentation/cubit/home_state.dart';
import 'package:alexapps_task/features/home/presentation/widgets/app_bar.dart';
import 'package:alexapps_task/features/home/presentation/widgets/app_categorias.dart';
import 'package:alexapps_task/features/home/presentation/widgets/app_productos.dart';
import 'package:alexapps_task/features/home/presentation/widgets/app_recomendados.dart';
import 'package:alexapps_task/features/product_detail/presentation/pages/product_detail_page.dart';
import 'package:alexapps_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..loadHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Material(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is HomeFailure) {
            return Material(
              child: Center(child: Text('Error: ${state.message}')),
            );
          } else if (state is HomeLoaded) {
            return Scaffold(
              appBar: const CustomAppBar(),
              body: Padding(
                padding: EdgeInsets.only(left: 18.0.w, top: 39.0.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header loop
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            AppStrings.explorarCategorias,
                            style: AppTextStyle.titleStyle,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 18.0.w),
                            child: const Text(
                              AppStrings.verTodos,
                              style: AppTextStyle.verTodosStyle,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(14.0.h),
                      // Categories
                      SizedBox(
                        height: 144.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: CategoriasConstants.categoryItems.length,
                          itemBuilder: (context, index) {
                            return AppCategorias(
                              category:
                                  CategoriasConstants.categoryItems[index],
                            );
                          },
                        ),
                      ),
                      // Popular Products
                      const Text(
                        AppStrings.productosPopulares,
                        style: AppTextStyle.titleStyle,
                      ),
                      verticalSpace(13.h),
                      SizedBox(
                        height: 230.h, // Adjusted height for product card
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.popularProducts.length,
                          separatorBuilder: (context, index) =>
                              horizontalSpace(16.w),
                          itemBuilder: (context, index) {
                            final product = state.popularProducts[index];
                            return AppProductos(
                              item: product,
                              onTap: (context) {
                                if (product.id == 'hamburguesa_special') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductDetailPage(),
                                    ),
                                  ).then((_) {
                                    if (context.mounted) {
                                      context.read<HomeCubit>().loadHomeData();
                                    }
                                  });
                                }
                              },
                            );
                          },
                        ),
                      ),
                      verticalSpace(13.h),
                      // Recommended
                      const Text(
                        AppStrings.recomendados,
                        style: AppTextStyle.titleStyle,
                      ),
                      verticalSpace(13.h),
                      SizedBox(
                        height: 170.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.recommendedProducts.length,
                          separatorBuilder: (context, index) =>
                              horizontalSpace(16.w),
                          itemBuilder: (context, index) {
                            final product = state.recommendedProducts[index];
                            return AppRecomendados(item: product);
                          },
                        ),
                      ),
                      verticalSpace(20.h),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container(); // Fallback
        },
      ),
    );
  }
}
