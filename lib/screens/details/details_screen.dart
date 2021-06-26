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
    // final ProductDetailsArguments agrs =
    //     ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: argss.product.rating, preferredSize : size, key: key!, child: null,),
      body: Body(product: argss.product, key: key!,),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
