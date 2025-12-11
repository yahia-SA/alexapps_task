import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:alexapps_task/features/home/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetRecommendedProducts implements UseCase<List<Product>, NoParams> {
  GetRecommendedProducts(this.repository);
  final ProductRepository repository;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getRecommendedProducts();
  }
}
