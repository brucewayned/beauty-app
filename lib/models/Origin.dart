class Origin {
  Origin({
    required this.name,
  });

  String name;

  static DefaultInstance(){
    return new Origin(name: '');
  }

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
