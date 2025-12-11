import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  const CartItem({required this.product, required this.quantity});
  final Product product;
  final int quantity;

  CartItem copyWith({Product? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [product, quantity];
}
