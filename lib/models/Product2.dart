import 'package:beautystall/models/Picture.dart';

import 'Brand.dart';
import 'BreadCrumb.dart';
import 'Features.dart';
import 'GradeByStar.dart';
import 'Origin.dart';
import 'Price.dart';


class Product2 {
  int id=0;
  int typeId=0;
  String name='';
  List<dynamic> breadcrumb=[];
  String description='';
  dynamic productDetail='';
  String caution='';
  String direction='';
  String ingredient='';
  dynamic specification='';
  Brand brand=Brand.DefaultInstance();
  Origin origin=Origin.DefaultInstance();
  String sku='';
  String slug='';
  int stock=0;
  Price price=Price.DefaultInstance();
  bool isNew=false;
  dynamic expiryDate='';
  dynamic barcode='';
  List<dynamic> images=[];
  Picture thumbnail=Picture.DefaultInstance();
  List<dynamic> bundles=[];
  List<dynamic> attributes=[];
  List<dynamic> options=[];
  List<dynamic> pwpPivot=[];
  String rating='';
  int reviewCount=0;
  dynamic googleReview='';
  List<dynamic> gradeByStar=[];
  Features features=Features.DefaultInstance();

  Product2({
    required this.id,
    required this.typeId,
    required this.name,
    required this.breadcrumb,
    required this.description,
    required this.productDetail,
    required this.caution,
    required this.direction,
    required this.ingredient,
    required this.specification,
    required this.brand,
    required this.origin,
    required this.sku,
    required this.slug,
    required this.stock,
    required this.price,
    required this.isNew,
    required this.expiryDate,
    required this.barcode,
    required this.images,
    required this.thumbnail,
    required this.bundles,
    required this.attributes,
    required this.options,
    required this.pwpPivot,
    required this.rating,
    required this.reviewCount,
    required this.googleReview,
    required this.gradeByStar,
    required this.features,
  });

  static Product2 DefaultInstance(){
    // List<Breadcrumb> breadCrumbs = List.filled(0, Breadcrumb.DefaultInstance(), growable: true);
    return new Product2(id: 0, typeId: 0, name: '', breadcrumb:[], description: '',
        productDetail: '', caution: '', direction: '', ingredient: '',
        specification: '', brand: Brand.DefaultInstance(), origin: Origin.DefaultInstance(), sku: '', slug: '',
        stock: 0, price: Price.DefaultInstance(), isNew: false, expiryDate: '', barcode: null, images: [],
        thumbnail: Picture.DefaultInstance(), bundles: [], attributes: [], options: [], pwpPivot: [],
        rating: '', reviewCount: 0, googleReview: '', gradeByStar: [], features: Features.DefaultInstance());
  }

  factory Product2.fromJson(Map<String, dynamic> json) => Product2(
    id: json["id"],
    typeId: json["type_id"],
    name: json["name"],
    breadcrumb: List<Breadcrumb>.from(json["breadcrumb"].map((x) => Breadcrumb.fromJson(x))),
    description: json["description"],
    productDetail: json["product_detail"],
    caution: json["caution"],
    direction: json["direction"],
    ingredient: json["ingredient"],
    specification: json["specification"],
    brand: Brand.fromJson(json["brand"]),
    origin: Origin.fromJson(json["origin"]),
    sku: json["sku"],
    slug: json["slug"],
    stock: json["stock"],
    price: Price.fromJson(json["price"]),
    isNew: json["is_new"],
    expiryDate: json["expiry_date"],
    barcode: json["barcode"],
    images: List<dynamic>.from(json["images"].map((x) => Picture.fromJson(x))),
    thumbnail: Picture.fromJson(json["thumbnail"]),
    bundles: List<dynamic>.from(json["bundles"].map((x) => x)),
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    pwpPivot: List<dynamic>.from(json["pwpPivot"].map((x) => x)),
    rating: json["rating"],
    reviewCount: json["review_count"],
    googleReview: json["google_review"],
    gradeByStar: List<GradeByStar>.from(json["grade_by_star"].map((x) => GradeByStar.fromJson(x))),
    features: Features.fromJson(json["features"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type_id": typeId,
    "name": name,
    "breadcrumb": List<dynamic>.from(breadcrumb.map((x) => x.toJson())),
    "description": description,
    "product_detail": productDetail,
    "caution": caution,
    "direction": direction,
    "ingredient": ingredient,
    "specification": specification,
    "brand": brand.toJson(),
    "origin": origin.toJson(),
    "sku": sku,
    "slug": slug,
    "stock": stock,
    "price": price.toJson(),
    "is_new": isNew,
    "expiry_date": expiryDate,
    "barcode": barcode,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "thumbnail": thumbnail.toJson(),
    "bundles": List<dynamic>.from(bundles.map((x) => x)),
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "options": List<dynamic>.from(options.map((x) => x)),
    "pwpPivot": List<dynamic>.from(pwpPivot.map((x) => x)),
    "rating": rating,
    "review_count": reviewCount,
    "google_review": googleReview,
    "grade_by_star": List<dynamic>.from(gradeByStar.map((x) => x.toJson())),
    "features": features.toJson(),
  };
}