// import 'package:json_annotation/json_annotation.dart';
// part 'GridItem.g.dart';
//
// @JsonSerializable()
// class GridItem {
//
//   GridItem(
//       this.name,
//       this.slug,
//       this.price_normal,
//       this.price_special,
//       this.is_new,
//       this.img_url,
//       this.rating,
//       );
//
//   @JsonKey(name:'title',defaultValue:'')
//   String name;
//   @JsonKey(name:'slug',defaultValue:'')
//   String slug;
//   @JsonKey(name:'price/normal',defaultValue:0)
//   double price_normal;
//   @JsonKey(name:'price/special',defaultValue:0)
//   double price_special;
//   @JsonKey(name:'is_new',defaultValue:false)
//   bool is_new;
//   @JsonKey(name:'thumbnail/img_url',defaultValue:'')
//   String img_url;
//   @JsonKey(name:'rating',defaultValue:'0.00')
//   String rating;
//
//   factory GridItem.fromJson(Map<String, dynamic> json) {
//
//     return _$GridItemFromJson(
//         json,
//         price_normal: (json['price']['normal'] as num?)?.toDouble() ?? 0,
//         price_special: (json['price']['special'] as num?)?.toDouble() ?? 0,
//     );
//   }
//
//   Map<String, dynamic> toJson(){
//     final output = _$GridItemToJson(this);
//     output['price'] = {'normal': price_normal};
//     output['price'] = {'special': price_special};
//     return output;
//   }
//
// }