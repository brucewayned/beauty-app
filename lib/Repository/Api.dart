import 'dart:developer';

import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/Grid.dart';
import 'package:beautystall/models/GridItem.dart';
import 'package:beautystall/models/Product2.dart';
import 'package:beautystall/models/Welcome.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:beautystall/models/Login.dart';

part 'Api.g.dart';

@RestApi(baseUrl : Api.baseUrl + Api.api)
abstract class Api {
  static const String baseUrl = 'https://nuxt.beautyimg.com/';
  static const String api = 'api/';
  factory Api(Dio dio) = _Api;

  /**
   * construct the full url to consume with a partial url given
   */
  static String getFinalImgUrl(String imgUrl){
    return baseUrl + imgUrl;
  }

  @POST('auth/login')
  Future<Login> doLogin(
      @Field('email') String email,
      @Field('password') String password,
      );

  @GET('new_arrivals')
  Future<Grid> getNewArrivals(
      @Query('pageSize') int pageSize,
      @Query('page') int page,
      );

  /**
   *  https://nuxt.beautyimg.com/api/product?id=7126
   */
  @GET('product')
  Future<Welcome> getProductDetails(
      @Query('id') int id,
      );

  @GET('/auth/wishlist')
  Future<void>getWishlist();
}