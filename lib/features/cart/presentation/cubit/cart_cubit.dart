import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/cart/domain/entities/cart_item.dart';
import 'package:alexapps_task/features/cart/domain/usecases/get_cart_items.dart';
import 'package:alexapps_task/features/cart/domain/usecases/remove_cart_item.dart';
import 'package:alexapps_task/features/cart/domain/usecases/update_cart_quantity.dart';
import 'package:alexapps_task/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required this.getCartItems,
    required this.updateCartQuantity,
    required this.removeCartItem,
  }) : super(CartInitial());
  final GetCartItems getCartItems;
  final UpdateCartQuantity updateCartQuantity;
  final RemoveCartItem removeCartItem;

  Future<void> loadCart() async {
    emit(CartLoading());
    final result = await getCartItems(NoParams());
    result.fold(
      (failure) => emit(
        CartError(message: failure.message),
      ), // Access message from failure
      (items) => _emitLoadedState(items),
    );
  }

  void _emitLoadedState(List<CartItem> items) {
    double subtotal = 0;
    for (var item in items) {
      subtotal += item.product.cost * item.quantity;
    }
    // "Gratis" or explicit cost. Design says "Gratis" for now, so 0.
    double tax = 0;
    double total = subtotal + tax;

    emit(CartLoaded(items: items, subtotal: subtotal, tax: tax, total: total));
  }

  Future<void> updateQuantity(String productId, int newQuantity) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;

      // Optimistic update logic could be complex with list immutability.
      // For simplicity and safety, we call the use case and then re-load
      // or manually update the local list if successful.

      // Let's allow optimistic UI updates for smoothness.
      final oldItems = currentState.items;

      // Create new list to trigger change
      final newItems = oldItems.map((item) {
        if (item.product.id == productId) {
          return CartItem(product: item.product, quantity: newQuantity);
        }
        return item;
      }).toList();
      if (newQuantity <= 0) {
        newItems.removeWhere((item) => item.product.id == productId);
      }

      _emitLoadedState(newItems);

      final result = await updateCartQuantity(
        UpdateCartQuantityParams(productId: productId, quantity: newQuantity),
      );

      result.fold(
        (failure) {
          // Revert state if failed
          _emitLoadedState(oldItems);
          // Ideally show error snackbar via listener
        },
        (_) {
          // Success, do nothing as we already updated UI
        },
      );
    }
  }

  Future<void> removeItem(String productId) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final oldItems = currentState.items;

      final newItems = List<CartItem>.from(oldItems);
      newItems.removeWhere((item) => item.product.id == productId);

      _emitLoadedState(newItems);

      final result = await removeCartItem(
        RemoveCartItemParams(productId: productId),
      );

      result.fold((failure) {
        _emitLoadedState(oldItems);
      }, (_) {});
    }
  }
}
