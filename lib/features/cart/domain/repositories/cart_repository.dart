import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/features/cart/domain/entities/cart_item.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItem>>> getCartItems();
  Future<Either<Failure, void>> updateCartItemQuantity(
    String productId,
    int quantity,
  );
  Future<Either<Failure, void>> removeCartItem(String productId);
}
