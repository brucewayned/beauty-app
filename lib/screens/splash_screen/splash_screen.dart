import 'package:flutter/material.dart';
import 'package:beautystall/screens/splash_screen/components/body.dart';
import 'package:beautystall/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash_screen";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
