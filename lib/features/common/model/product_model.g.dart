// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map json) => _ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      price: json['price'] as String,
      updatedAt: json['updatedAt'] as String,
      isFavorite: json['isFavorite'] as bool,
      tag: json['tag'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
      'updatedAt': instance.updatedAt,
      'isFavorite': instance.isFavorite,
      'tag': instance.tag,
      'location': instance.location,
    };
