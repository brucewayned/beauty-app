import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:beautystall/models/Login.dart';

part 'Api.g.dart';

@RestApi(baseUrl : 'https://nuxt.beautyimg.com/api/')
abstract class Api {
  factory Api(Dio dio) = _Api;

  @POST('/auth/login')
  Future<Login> doLogin(
      @Field('email') String email,
      @Field('password') String password,
      );
}