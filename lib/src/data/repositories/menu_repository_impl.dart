import 'package:food_picker/src/core/constants/api_endpoints.dart';
import 'package:food_picker/src/core/services/api_services/api_service.dart';
import 'package:food_picker/src/domain/models/menu_model/menu_model.dart';
import 'package:food_picker/src/domain/repositories/menu_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final Api api;
  final ApiEndpoints endpoints;

  MenuRepositoryImpl(this.endpoints, {required this.api});

  @override
  Future<MenuModel> fetchMenu() async {
    var response = await api.general.get(endpoints.fetchMenu);
    return MenuModel.fromJson(response.data);
  }
}
