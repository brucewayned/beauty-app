import 'package:flutter/material.dart';
import 'package:beautystall/screens/app_intro/components/body.dart';
import 'package:beautystall/size_config.dart';

class AppIntro extends StatelessWidget {
  static String routeName = "/app_intro";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
