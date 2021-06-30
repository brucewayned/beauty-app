import 'package:beautystall/components/SpinnerWidget.dart';
import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/Product2.dart';
import 'package:beautystall/service/ProductService.dart';
import 'package:flutter/material.dart';
import 'package:beautystall/components/default_button.dart';
import 'package:beautystall/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Data data;

  const Body({required Key key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductService productService = new ProductService(context: context);
    return FutureBuilder(
        future: productService.getProductDetails(data.id),
        builder:  (BuildContext context, AsyncSnapshot<Product2> snapshot) {
          if(snapshot.hasData) {
            return getListView(snapshot.data!);
          }
          return SpninnerWidget();
        },
    );
  }

  Widget getListView(Product2 product2){
    return ListView(
      children: [
        ProductImages(product: product2, key: UniqueKey(),),
        TopRoundedContainer(
          color: Colors.white,
          key: UniqueKey(),
          child: Column(
            children: [
              ProductDescription(
                product: product2,
                pressOnSeeMore: () {}, key: UniqueKey(),
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                key: UniqueKey(),
                child: Column(
                  children: [
                    // ColorDots(product: product, key: key!,), TODO color
                    TopRoundedContainer(
                      color: Colors.white,
                      key: UniqueKey(),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {}, key: UniqueKey(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
