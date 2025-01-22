import 'package:flutter/material.dart';
import 'package:food_picker/src/domain/models/menu_model/menu_model.dart';
import 'package:food_picker/src/presentation/views/home_view/widgets/dish_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (context, index) {
        return DishWidget(
          dish: category.dishes[index],
        );
      },
      itemCount: category.dishes.length,
    );
  }
}