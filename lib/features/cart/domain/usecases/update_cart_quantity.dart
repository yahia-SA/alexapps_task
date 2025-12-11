import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateCartQuantity implements UseCase<void, UpdateCartQuantityParams> {
  UpdateCartQuantity(this.repository);
  final CartRepository repository;

  @override
  Future<Either<Failure, void>> call(UpdateCartQuantityParams params) async {
    return await repository.updateCartItemQuantity(
      params.productId,
      params.quantity,
    );
  }
}

class UpdateCartQuantityParams extends Equatable {
  const UpdateCartQuantityParams({
    required this.productId,
    required this.quantity,
  });
  final String productId;
  final int quantity;

  @override
  List<Object> get props => [productId, quantity];
}
