import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';
import 'package:alexapps_task/features/home/data/models/category_model.dart';

class CategoriasConstants {
  static final List<Category> categoryItems = [
    Category(
      name: AppStrings.tacos,
      iconPath: AppImages.tacos,
      backgorundColor: AppColor.tacoBackground,
    ),
    Category(
      name: AppStrings.frias,
      iconPath: AppImages.frias,
      backgorundColor: AppColor.friesBackground,
    ),
    Category(
      name: AppStrings.burger,
      iconPath: AppImages.burger,
      backgorundColor: AppColor.burgerBackground,
    ),
    Category(
      name: AppStrings.pizza,
      iconPath: AppImages.pizza,
      backgorundColor: AppColor.pizzaBackground,
    ),
    Category(
      name: AppStrings.burrito,
      iconPath: AppImages.burritos,
      backgorundColor: AppColor.burritoBackground,
    ),
  ];
}
