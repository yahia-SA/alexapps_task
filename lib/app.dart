import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alexapps_task/features/cart/presentation/pages/cart_page.dart';
import 'package:alexapps_task/features/home/presentation/pages/home_page.dart';
import 'package:alexapps_task/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';
import 'package:alexapps_task/features/nav_bar/presentation/cubit/nav_bar_state.dart';
import 'package:alexapps_task/features/nav_bar/presentation/pages/nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alexapps_task/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppTheme.lightTheme,
          home: BlocProvider(
            create: (_) => NavBarCubit(),
            child: Scaffold(
              body: BlocBuilder<NavBarCubit, NavBarState>(
                builder: (context, state) {
                  return IndexedStack(
                    index: state.selectedIndex,
                    children: const [
                      HomePage(),
                      Center(child: Text('shop page')),
                      CartPage(),
                      Center(child: Text('favorite page')),
                      Center(child: Text('profile page')),
                    ],
                  );
                },
              ),
              bottomNavigationBar: const NavBarPage(),
            ),
          ),
        );
      },
    );
  }
}
