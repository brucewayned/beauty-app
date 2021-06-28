// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grid _$GridFromJson(Map<String, dynamic> json) {
  return Grid(
    (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GridToJson(Grid instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
