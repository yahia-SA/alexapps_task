import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/features/home/data/datasources/product_local_data_source.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:alexapps_task/features/home/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.localDataSource});
  final ProductLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Product>>> getPopularProducts() async {
    try {
      final result = await localDataSource.getPopularProducts();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getRecommendedProducts() async {
    try {
      final result = await localDataSource.getRecommendedProducts();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(String productId) async {
    try {
      await localDataSource.toggleFavorite(productId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> getFavoriteStatus(String productId) async {
    try {
      final result = await localDataSource.getFavoriteStatus(productId);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
