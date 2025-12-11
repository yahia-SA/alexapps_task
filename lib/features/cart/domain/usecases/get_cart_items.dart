import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/cart/domain/entities/cart_item.dart';
import 'package:alexapps_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetCartItems implements UseCase<List<CartItem>, NoParams> {
  GetCartItems(this.repository);
  final CartRepository repository;

  @override
  Future<Either<Failure, List<CartItem>>> call(NoParams params) async {
    return await repository.getCartItems();
  }
}
