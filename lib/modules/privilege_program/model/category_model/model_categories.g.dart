// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModelsCategories _$$_ModelsCategoriesFromJson(Map<String, dynamic> json) =>
    _$_ModelsCategories(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      countShop: json['count_shop'] as int?,
      mimeTypeImag: json['mime_type'] as String?,
    );

Map<String, dynamic> _$$_ModelsCategoriesToJson(_$_ModelsCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'count_shop': instance.countShop,
      'mime_type': instance.mimeTypeImag,
    };
