import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/core/extensions/string_extensions.dart';
import 'package:alexapps_task/features/home/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getPopularProducts();
  Future<List<ProductModel>> getRecommendedProducts();
  Future<void> toggleFavorite(String productId);
  Future<bool> getFavoriteStatus(String productId);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  ProductLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    // Simulate delay
    await Future.delayed(const Duration(milliseconds: 500));
    final products = [
      ProductModel(
        id: 'pizza_1',
        name: AppStrings.pizzaClasica,
        subName: AppStrings.salsaClasica,
        cost: AppStrings.price.toDouble(),
        imagePath: AppImages.pizzaClassic2,
      ),
      ProductModel(
        id: 'hamburguesa_special',
        name: AppStrings.hamburguesaMix,
        subName: AppStrings.dobleCarne,
        cost: AppStrings.price.toDouble(),
        imagePath: AppImages.hamburguesa2,
      ),
      ProductModel(
        id: 'pizza_2', // Changed ID to be unique
        name: AppStrings.pizzaClasica,
        subName: AppStrings.salsaClasica,
        cost: AppStrings.price.toDouble(),
        imagePath: AppImages.pizzaClassic2,
      ),
    ];

    // Sync with favorites
    List<ProductModel> syncProducts = [];
    for (var item in products) {
      final isFav = sharedPreferences.getBool('favorite_${item.id}') ?? false;
      syncProducts.add(
        ProductModel(
          id: item.id,
          name: item.name,
          subName: item.subName,
          cost: item.cost,
          imagePath: item.imagePath,
          isFavorite: isFav,
        ),
      );
    }

    return syncProducts;
  }

  @override
  Future<List<ProductModel>> getRecommendedProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final products = [
      const ProductModel(
        id: 'rec_1',
        name: AppStrings.malteadasTropicales,
        subName: AppStrings.elaboradoConJugos,
        cost: 12.58,
        imagePath: AppImages.juicePng,
      ),
      const ProductModel(
        id: 'rec_2',
        name: AppStrings.malteadasTropicales,
        subName: AppStrings.salsaClasica,
        cost: 20.00,
        imagePath: AppImages.juice2Png,
      ),
    ];

    List<ProductModel> syncProducts = [];
    for (var item in products) {
      final isFav = sharedPreferences.getBool('favorite_${item.id}') ?? false;
      syncProducts.add(
        ProductModel(
          id: item.id,
          name: item.name,
          subName: item.subName,
          cost: item.cost,
          imagePath: item.imagePath,
          isFavorite: isFav,
        ),
      );
    }
    return syncProducts;
  }

  @override
  Future<void> toggleFavorite(String productId) async {
    final current = sharedPreferences.getBool('favorite_$productId') ?? false;
    await sharedPreferences.setBool('favorite_$productId', !current);
  }

  @override
  Future<bool> getFavoriteStatus(String productId) async {
    return sharedPreferences.getBool('favorite_$productId') ?? false;
  }
}
