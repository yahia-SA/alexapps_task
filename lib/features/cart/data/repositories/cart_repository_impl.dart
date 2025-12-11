import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:alexapps_task/features/cart/domain/entities/cart_item.dart';
import 'package:alexapps_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required this.localDataSource});
  final CartLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems() async {
    try {
      final items = await localDataSource.getCartItems();
      return Right(items);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeCartItem(String productId) async {
    try {
      await localDataSource.removeCartItem(productId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartItemQuantity(
    String productId,
    int quantity,
  ) async {
    try {
      await localDataSource.updateCartItemQuantity(productId, quantity);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
