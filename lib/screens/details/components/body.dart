import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({required Key key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product, key: key!,),
        TopRoundedContainer(
          color: Colors.white,
          key: key!,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {}, key: key!,
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                key: key!,
                child: Column(
                  children: [
                    ColorDots(product: product, key: key!,),
                    TopRoundedContainer(
                      color: Colors.white,
                      key: key!,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {}, key: key!,
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
