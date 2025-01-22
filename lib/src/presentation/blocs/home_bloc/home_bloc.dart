import 'package:bloc/bloc.dart';
import 'package:food_picker/src/domain/models/menu_model/menu_model.dart';
import 'package:food_picker/src/domain/repositories/menu_repository.dart';
import 'package:food_picker/src/presentation/core/status/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MenuRepository menuRepository;

  HomeBloc(this.menuRepository) : super(HomeState.initial()) {
    on<_FetchMenu>(_fetchMenu);
  }

  Future<void> _fetchMenu(_FetchMenu event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(fetchMenuStatus: StatusLoading(), menu: MenuModel()));
      var menu = await menuRepository.fetchMenu();
      emit(state.copyWith(fetchMenuStatus: StatusSuccess(), menu: menu));
    } catch (e) {
      emit(state.copyWith(fetchMenuStatus: StatusFailure(e.toString()), menu: MenuModel()));
    }
  }
}
