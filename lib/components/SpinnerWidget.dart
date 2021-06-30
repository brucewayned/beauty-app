
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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