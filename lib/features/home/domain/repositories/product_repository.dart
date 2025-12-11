import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getPopularProducts();
  Future<Either<Failure, List<Product>>> getRecommendedProducts();
  Future<Either<Failure, void>> toggleFavorite(String productId);
  Future<Either<Failure, bool>> getFavoriteStatus(String productId);
}
