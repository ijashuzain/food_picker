import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel({
    @Default([]) @JsonKey(name: 'categories') List<CategoryModel> categories,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @Default(0) int id,
    @Default('') String name,
    @Default([]) List<DishModel> dishes,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

@freezed
class DishModel with _$DishModel {
  const factory DishModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String price,
    @Default('INR') String currency,
    @Default(0) int calories,
    @Default('') String description,
    @Default([]) List<AddonModel> addons,
    @Default('') @JsonKey(name: 'image_url') String imageUrl,
    @Default(false) @JsonKey(name: 'customizations_available') bool customizationsAvailable,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) => _$DishModelFromJson(json);
}

@freezed
class AddonModel with _$AddonModel {
  const factory AddonModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String price,
  }) = _AddonModel;

  factory AddonModel.fromJson(Map<String, dynamic> json) => _$AddonModelFromJson(json);
}
