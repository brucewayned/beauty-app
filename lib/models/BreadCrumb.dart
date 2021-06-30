class Breadcrumb {
  Breadcrumb({
    required this.text,
    required this.url,
  });

  String text;
  String url;

  static Breadcrumb DefaultInstance(){
    return new Breadcrumb(text: '', url: '');
  }

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
    text: json["text"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "url": url,
  };
}
