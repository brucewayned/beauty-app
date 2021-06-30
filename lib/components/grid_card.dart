import 'package:beautystall/Repository/Api.dart';
import 'package:beautystall/models/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beautystall/models/Product.dart';
import 'package:beautystall/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    required Key key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.data,
  }) : super(key: key);

  final double width, aspectRatio;
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(data: data),//TODO later
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: data.id,//TODO later//gridItem.id.toString(),
                    child: Image.network(Api.getFinalImgUrl(data.thumbnail.imgUrl)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.name,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${data.price.normal}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        // color: gridItem.isFavourite
                        //     ? kPrimaryColor.withOpacity(0.15)
                        //     : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      // child: SvgPicture.asset(
                      //   "assets/icons/Heart Icon_2.svg",
                      //   color: product.isFavourite
                      //       ? Color(0xFFFF4848)
                      //       : Color(0xFFDBDEE4),
                      // ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
