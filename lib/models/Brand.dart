class Brand {
  Brand({
    required this.name,
    required this.slug,
  });

  String name;
  String slug;

  static Brand DefaultInstance(){
    return new Brand(name: '', slug: '');
  }

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
  };
}