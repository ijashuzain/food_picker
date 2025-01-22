// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuModelImpl _$$MenuModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuModelImpl(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MenuModelImplToJson(_$MenuModelImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      dishes: (json['dishes'] as List<dynamic>?)
              ?.map((e) => DishModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dishes': instance.dishes,
    };

_$DishModelImpl _$$DishModelImplFromJson(Map<String, dynamic> json) =>
    _$DishModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as String? ?? '',
      currency: json['currency'] as String? ?? 'INR',
      calories: (json['calories'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      addons: (json['addons'] as List<dynamic>?)
              ?.map((e) => AddonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imageUrl: json['image_url'] as String? ?? '',
      customizationsAvailable:
          json['customizations_available'] as bool? ?? false,
    );

Map<String, dynamic> _$$DishModelImplToJson(_$DishModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'calories': instance.calories,
      'description': instance.description,
      'addons': instance.addons,
      'image_url': instance.imageUrl,
      'customizations_available': instance.customizationsAvailable,
    };

_$AddonModelImpl _$$AddonModelImplFromJson(Map<String, dynamic> json) =>
    _$AddonModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as String? ?? '',
    );

Map<String, dynamic> _$$AddonModelImplToJson(_$AddonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
