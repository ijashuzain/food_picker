part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required Status fetchMenuStatus,
    required MenuModel menu,
  }) =
      _HomeState;

  factory HomeState.initial() => HomeState(
        fetchMenuStatus: Status.initial(),
        menu: MenuModel(),
      );
}
