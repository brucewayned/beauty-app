import 'package:beautystall/screens/home/components/new_arrivals.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(key: UniqueKey(),),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(key: UniqueKey(),),
            Categories(),
            // SpecialOffers(key: UniqueKey(),),
            NewArrivals(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
