import 'package:alexapps_task/features/home/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded({
    required this.popularProducts,
    required this.recommendedProducts,
  });
  final List<Product> popularProducts;
  final List<Product> recommendedProducts;

  @override
  List<Object> get props => [popularProducts, recommendedProducts];
}

class HomeFailure extends HomeState {
  const HomeFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
