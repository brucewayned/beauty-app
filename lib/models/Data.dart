import 'Price.dart';
import 'Thumbnail.dart';

class Data {
  Data(
      this.id,
        this.sku,
        this.typeId,
        this.name,
        this.slug,
        this.stock,
        this.price,
        this.isNew,
        this.thumbnail,
        this.rating,
        this.reviewCount);

  int id=0;
  String sku='';
  int typeId=0;
  String name='';
  String slug='';
  int stock=0;
  Price price=Price.DefaultInstance();
  bool isNew=false;
  Thumbnail thumbnail=Thumbnail.DefaultInstance();
  String rating='';
  int reviewCount=0;

  static DefaultInstance(){
    return new Data(0, '', 0, '', '', 0, Price.DefaultInstance(),
        false, Thumbnail.DefaultInstance(), '', 0);
  }

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    typeId = json['type_id'];
    name = json['name'];
    slug = json['slug'];
    stock = json['stock'];
    price = (json['price'] != null ? new Price.fromJson(json['price']) : null)!;
    isNew = json['is_new'];
    thumbnail = (json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null)!;
    rating = json['rating'];
    reviewCount = json['review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['type_id'] = this.typeId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['stock'] = this.stock;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    data['is_new'] = this.isNew;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['rating'] = this.rating;
    data['review_count'] = this.reviewCount;
    return data;
  }
}