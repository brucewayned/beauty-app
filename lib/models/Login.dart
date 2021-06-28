import 'package:json_annotation/json_annotation.dart';
part 'Login.g.dart';

@JsonSerializable()
class Login {
  Login(
      // this.name,
      this.token,
      this.errors
      );
  // User(this.name,this.email);

  // @JsonKey(name:'name')
  // String name;
  @JsonKey(name:'token',defaultValue:'')
  String token;
  @JsonKey(name:'errors',defaultValue:'')
  String errors;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}