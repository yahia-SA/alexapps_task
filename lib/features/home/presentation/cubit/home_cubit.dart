import 'package:alexapps_task/core/usecases/usecase.dart';
import 'package:alexapps_task/features/home/domain/usecases/get_popular_products.dart';
import 'package:alexapps_task/features/home/domain/usecases/get_recommended_products.dart';
import 'package:alexapps_task/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getPopularProducts,
    required this.getRecommendedProducts,
  }) : super(HomeInitial());
  final GetPopularProducts getPopularProducts;
  final GetRecommendedProducts getRecommendedProducts;

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    try {
      final popularResult = await getPopularProducts(NoParams());
      final recommendedResult = await getRecommendedProducts(NoParams());

      popularResult.fold((failure) => emit(HomeFailure(failure.message)), (
        popular,
      ) {
        recommendedResult.fold(
          (failure) => emit(HomeFailure(failure.message)),
          (recommended) => emit(
            HomeLoaded(
              popularProducts: popular,
              recommendedProducts: recommended,
            ),
          ),
        );
      });
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
