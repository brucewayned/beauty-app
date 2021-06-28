import 'package:beautystall/components/grid_card.dart';
import 'package:beautystall/models/Data.dart';
import 'package:beautystall/models/Grid.dart';
import 'package:beautystall/service/GridService.dart';
import 'package:flutter/material.dart';
import 'package:beautystall/components/product_card.dart';
import 'package:beautystall/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class NewArrivals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GridService gridService = new GridService(context: context);
    final int page = 1;
    final int pageSize = 3;

    return FutureBuilder(
      future: gridService.getNewArrivals(pageSize, page),
      builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
        if(snapshot.hasData) {
          return getGridLayout(snapshot.data!);
        }
        return SpninnerWidget();
      },

    );

  }

  Widget getGridLayout(final List<Data> dataList){
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "New Arrivals", press: () {}, key: UniqueKey(),),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                dataList.length,
                (index) {
                  // if (demoProducts[index].isPopular)
                  return GridCard(data: dataList[index], key: UniqueKey(),);
                  // return SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}

class SpninnerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: AlignmentDirectional.bottomCenter,
          child: Column(
            children: <Widget>[
              CircularProgressIndicator(),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
          )),
    );
  }
}