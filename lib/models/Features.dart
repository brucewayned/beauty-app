class Features {
  Features({
    required this.benefits,
    required this.skinType,
    required this.skinConcern,
  });

  List<String>? benefits=[];
  List<String>? skinType=[];
  List<String>? skinConcern=[];

  static DefaultInstance(){
    return new Features(benefits: [], skinType: [], skinConcern: []);
  }

  factory Features.fromJson(Map<String, dynamic> json) => Features(
    benefits: (json['Benefits'] != null ? (List<String>.from(json["Benefits"].map((x) => x))) : null),
    skinType: (json['Skin Type'] != null ? (List<String>.from(json["Skin Type"].map((x) => x))) : null),
    skinConcern: (json['Skin Concern'] != null ? (List<String>.from(json["Skin Concern"].map((x) => x))) : null),
  );

  Map<String, dynamic> toJson() => {
    "Benefits": List<String>.from(benefits!.map((x) => x)),
    "Skin Type": List<String>.from(skinType!.map((x) => x)),
    "Skin Concern": List<String>.from(skinConcern!.map((x) => x)),
  };
}