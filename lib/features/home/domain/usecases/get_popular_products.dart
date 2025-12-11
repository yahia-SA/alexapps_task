import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:alexapps_task/features/home/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularProducts implements UseCase<List<Product>, NoParams> {
  GetPopularProducts(this.repository);
  final ProductRepository repository;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getPopularProducts();
  }
}
