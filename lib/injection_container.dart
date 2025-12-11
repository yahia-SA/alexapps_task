import 'package:alexapps_task/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:alexapps_task/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:alexapps_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:alexapps_task/features/cart/domain/usecases/get_cart_items.dart';
import 'package:alexapps_task/features/cart/domain/usecases/remove_cart_item.dart';
import 'package:alexapps_task/features/cart/domain/usecases/update_cart_quantity.dart';
import 'package:alexapps_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alexapps_task/features/home/data/datasources/product_local_data_source.dart';
import 'package:alexapps_task/features/home/data/repositories/product_repository_impl.dart';
import 'package:alexapps_task/features/home/domain/repositories/product_repository.dart';
import 'package:alexapps_task/features/home/domain/usecases/get_favorite_status.dart';
import 'package:alexapps_task/features/home/domain/usecases/get_popular_products.dart';
import 'package:alexapps_task/features/home/domain/usecases/get_recommended_products.dart';
import 'package:alexapps_task/features/home/domain/usecases/toggle_favorite.dart';
import 'package:alexapps_task/features/home/presentation/cubit/favorite_cubit.dart';
import 'package:alexapps_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> init() async {
  //! Features - Home
  // Bloc
  sl.registerFactory(
    () => HomeCubit(getPopularProducts: sl(), getRecommendedProducts: sl()),
  );
  sl.registerFactoryParam<FavoriteCubit, String, void>(
    (itemId, _) => FavoriteCubit(
      toggleFavorite: sl(),
      getFavoriteStatus: sl(),
      itemId: itemId,
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPopularProducts(sl()));
  sl.registerLazySingleton(() => GetRecommendedProducts(sl()));
  sl.registerLazySingleton(() => ToggleFavorite(sl()));
  sl.registerLazySingleton(() => GetFavoriteStatus(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Features - Cart
  // Bloc
  sl.registerFactory(
    () => CartCubit(
      getCartItems: sl(),
      updateCartQuantity: sl(),
      removeCartItem: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCartItems(sl()));
  sl.registerLazySingleton(() => UpdateCartQuantity(sl()));
  sl.registerLazySingleton(() => RemoveCartItem(sl()));

  // Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
