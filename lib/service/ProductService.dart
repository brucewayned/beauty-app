import 'package:beautystall/Repository/ProductRepo.dart';
import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/Grid.dart';
import 'package:beautystall/models/Product2.dart';
import 'package:beautystall/models/Welcome.dart';
import 'package:beautystall/service/_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductService extends Service {
  ProductService({required BuildContext context}) : super(context);

  late Function _goToPageFunc;
  final ProductRepo _productRepo = ProductRepo();

  Future<List<Data>> getNewArrivals(int pageSize, int page) async {
    List<Data> dataList = List.filled(0,
        Data.DefaultInstance(), growable: true);

    await _productRepo.getNewArrivals(pageSize, page)
        .then((Grid grid){
      dataList.clear();
      dataList = grid.data;
        })
        .catchError((Object error) => showError(error.toString()));

    return dataList;
  }

  Future<Product2> getProductDetails(int id) async {
    Product2 product2 = Product2.DefaultInstance();
    await _productRepo.getProductDetails(id)
        .then((Welcome welcome){
          product2 = welcome.product2;
        });
        // .catchError((Object error) => showError(error.toString()));
    return product2;
  }

}