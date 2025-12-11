import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RemoveCartItem implements UseCase<void, RemoveCartItemParams> {
  RemoveCartItem(this.repository);
  final CartRepository repository;

  @override
  Future<Either<Failure, void>> call(RemoveCartItemParams params) async {
    return await repository.removeCartItem(params.productId);
  }
}

class RemoveCartItemParams extends Equatable {
  const RemoveCartItemParams({required this.productId});
  final String productId;

  @override
  List<Object> get props => [productId];
}
