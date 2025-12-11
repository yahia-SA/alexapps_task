import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alexapps_task/features/nav_bar/presentation/cubit/nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());
  void changeIndex(int index) {
    emit(NavBarChangeIndex(index));
  }

}
