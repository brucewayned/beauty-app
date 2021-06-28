import 'dart:convert';
import 'dart:developer';

import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/GridItem.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Grid.g.dart';

@JsonSerializable(explicitToJson: true)
class Grid {

  Grid(
      this.data,
      );

  @JsonKey(name: 'data')
  final List<Data> data;


  // factory Grid.fromJson(Map<String, dynamic> json) {
  //   var dataObj = json['data'] as List;
  //   List<GridItem> data = dataObj.map((gridItem) => GridItem.fromJson(json)).toList();
  //   return _$GridFromJson(json);
  // }

  // Map<String, dynamic> toJson() => _$GridToJson(this);

  factory Grid.fromJson(Map<String, dynamic> json) {
    return _$GridFromJson(json);}

    Map<String, dynamic> toJson() => _$GridToJson(this);
}

