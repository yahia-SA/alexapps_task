import 'package:alexapps_task/core/constants/app_images.dart';
import 'package:alexapps_task/core/constants/app_strings.dart';
import 'package:alexapps_task/features/cart/data/models/cart_item_model.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> updateCartItemQuantity(String productId, int quantity);
  Future<void> removeCartItem(String productId);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  // Mock data simulation
  final List<CartItemModel> _items = [
    const CartItemModel(
      product: Product(
        id: '1',
        name: AppStrings.bigBurgerQueso,
        subName: AppStrings.productDescription,
        cost: 20.0,
        imagePath: AppImages.blackBurger,
      ),
      quantity: 2,
    ),
    const CartItemModel(
      product: Product(
        id: '2',
        name: AppStrings.bigBurger,
        subName: AppStrings.productDescription,
        cost: 15.0,
        imagePath: AppImages.classicBurger,
      ),
      quantity: 1,
    ),
  ];

  @override
  Future<List<CartItemModel>> getCartItems() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _items;
  }

  @override
  Future<void> removeCartItem(String productId) async {
    _items.removeWhere((item) => item.product.id == productId);
  }

  @override
  Future<void> updateCartItemQuantity(String productId, int quantity) async {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index] = CartItemModel(
          product: _items[index].product,
          quantity: quantity,
        );
      }
    }
  }
}
