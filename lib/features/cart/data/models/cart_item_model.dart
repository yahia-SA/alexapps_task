import 'package:alexapps_task/features/cart/domain/entities/cart_item.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';

class CartItemModel extends CartItem {
  const CartItemModel({required super.product, required super.quantity});

  factory CartItemModel.fromProduct(Product product, int quantity) {
    return CartItemModel(product: product, quantity: quantity);
  }
}
