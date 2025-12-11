import 'package:alexapps_task/core/error/failures.dart';
import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/home/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetFavoriteStatus implements UseCase<bool, GetFavoriteStatusParams> {
  GetFavoriteStatus(this.repository);
  final ProductRepository repository;

  @override
  Future<Either<Failure, bool>> call(GetFavoriteStatusParams params) async {
    return await repository.getFavoriteStatus(params.id);
  }
}

class GetFavoriteStatusParams extends Equatable {
  const GetFavoriteStatusParams({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}
