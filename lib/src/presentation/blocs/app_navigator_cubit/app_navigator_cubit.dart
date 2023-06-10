import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_navigator_state.dart';

class AppNavigatorCubit extends Cubit<AppNavigatorState> {
  AppNavigatorCubit() : super(const SelectedNavItemState(0));
  gotoPageAtIndex(int index) {
    emit(SelectedNavItemState(index));
  }
}
