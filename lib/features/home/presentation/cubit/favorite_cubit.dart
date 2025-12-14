import 'package:alexapps_task/features/home/domain/usecases/get_favorite_status.dart';
import 'package:alexapps_task/features/home/domain/usecases/toggle_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit({
    required this.toggleFavorite,
    required this.getFavoriteStatus,
    required this.itemId,
  }) : super(false) {
    _loadFavoriteState();
  }
  final ToggleFavorite toggleFavorite;
  final GetFavoriteStatus getFavoriteStatus;
  final String itemId;

  Future<void> _loadFavoriteState() async {
    final result = await getFavoriteStatus(GetFavoriteStatusParams(id: itemId));
    result.fold((failure) => null, (isFavorite) => emit(isFavorite));
  }

  Future<void> toggle() async {
    final newState = !state;
    emit(newState);

    final result = await toggleFavorite(ToggleFavoriteParams(id: itemId));
    result.fold((failure) {
      emit(!newState);
    }, (_) => null);
  }
}
