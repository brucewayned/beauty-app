class GradeByStar {
  GradeByStar({
    required this.grade,
    required this.count,
  });

  int grade;
  int count;

  factory GradeByStar.fromJson(Map<String, dynamic> json) => GradeByStar(
    grade: json["grade"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "grade": grade,
    "count": count,
  };
}