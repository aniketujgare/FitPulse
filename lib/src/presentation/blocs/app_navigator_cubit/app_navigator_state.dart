part of 'app_navigator_cubit.dart';

abstract class AppNavigatorState extends Equatable {
  final int index;

  const AppNavigatorState(this.index);

  @override
  List<Object> get props => [index];
}

class SelectedNavItemState extends AppNavigatorState {
  const SelectedNavItemState(newIndex) : super(newIndex);
}
