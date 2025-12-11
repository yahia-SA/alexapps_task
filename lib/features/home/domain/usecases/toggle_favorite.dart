import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/home/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ToggleFavorite implements UseCase<void, ToggleFavoriteParams> {
  ToggleFavorite(this.repository);
  final ProductRepository repository;

  @override
  Future<Either<Failure, void>> call(ToggleFavoriteParams params) async {
    return await repository.toggleFavorite(params.id);
  }
}

class ToggleFavoriteParams extends Equatable {
  const ToggleFavoriteParams({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}
