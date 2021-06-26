import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:beautystall/models/Login.dart';

import 'Api.dart';


class FormRepo {
  FormRepo() {
    _dio = Dio();
    _api = Api(_dio);
  }

  late Dio _dio;
  late Api _api;
  final Logger logger = Logger();

  Future<Login> doLogin(String email, String password)  {
    return _api.doLogin(email, password);
  }
}