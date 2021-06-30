import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/Product2.dart';
import 'package:flutter/material.dart';
import 'package:beautystall/size_config.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  Size size = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    final argss = ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    double rating = double.parse(argss.data.rating);
    // final ProductDetailsArguments agrs =
    //     ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: rating, preferredSize : size, key: UniqueKey(), 
        child: new Text(''),),
      body: Body(data: argss.data, key: UniqueKey(),),
    );
  }
}

class ProductDetailsArguments {
  final Data data;

  ProductDetailsArguments({required this.data});
}
