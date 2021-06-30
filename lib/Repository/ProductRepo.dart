import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/Grid.dart';
import 'package:beautystall/models/Product2.dart';
import 'package:beautystall/models/Welcome.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:beautystall/models/GridItem.dart';

import 'Api.dart';


class ProductRepo {
  ProductRepo() {
    _dio = Dio();
    _api = Api(_dio);
  }

  late Dio _dio;
  late Api _api;
  final Logger logger = Logger();

  Future<Grid> getNewArrivals(int pageSize, int page)  {
    return _api.getNewArrivals(pageSize, page);
  }

  Future<Welcome> getProductDetails(int id)  {
    return _api.getProductDetails(id);
  }
}