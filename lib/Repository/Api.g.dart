// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Api implements Api {
  _Api(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://nuxt.beautyimg.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Login> doLogin(email, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': email, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Login>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Login.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Grid> getNewArrivals(pageSize, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'page': page
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Grid>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'new_arrivals',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Grid.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Welcome> getProductDetails(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Welcome>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'product',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Welcome.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> getWishlist() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/auth/wishlist',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
