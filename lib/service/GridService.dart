import 'package:beautystall/Repository/GridRepo.dart';
import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/Grid.dart';
import 'package:beautystall/service/_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridService extends Service {
  GridService({required BuildContext context}) : super(context);

  late Function _goToPageFunc;
  final GridRepo _gridRepo = GridRepo();

  Future<List<Data>> getNewArrivals(int pageSize, int page) async {
    List<Data> dataList = List.filled(0,
        Data.DefaultInstance(), growable: true);

    await _gridRepo.getNewArrivals(pageSize, page)
        .then((Grid grid){
      dataList.clear();
      dataList = grid.data;
        })
        .catchError((Object error) => showError(error.toString()));

    return dataList;
  }

}