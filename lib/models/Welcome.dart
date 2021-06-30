import 'Product2.dart';

/**
 * The json class with the root - 'data'
 */
class Welcome {
  Welcome({
    required this.product2,
  });

  Product2 product2;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    product2: Product2.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": product2.toJson(),
  };
}