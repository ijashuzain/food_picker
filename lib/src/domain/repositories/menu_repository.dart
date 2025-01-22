import 'package:food_picker/src/domain/models/menu_model/menu_model.dart';

abstract class MenuRepository{
  Future<MenuModel> fetchMenu();
}