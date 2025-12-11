import 'package:alexapps_task/features/cart/domain/entities/cart_item.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  const CartLoaded({
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.total,
  });
  final List<CartItem> items;
  final double subtotal;
  final double tax; // Envio/Delivery
  final double total;

  CartLoaded copyWith({
    List<CartItem>? items,
    double? subtotal,
    double? tax,
    double? total,
  }) {
    return CartLoaded(
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [items, subtotal, tax, total];
}

class CartError extends CartState {
  const CartError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
