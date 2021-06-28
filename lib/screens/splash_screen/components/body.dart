import 'dart:async';
import 'dart:developer';

import 'package:beautystall/screens/app_intro/app_intro.dart';
import 'package:beautystall/screens/home/home_screen.dart';
import 'package:beautystall/screens/splash_screen/components/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final int _show_logo_duration = 1;

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: _show_logo_duration), () => isLoggedIn(context)
    );
    print('Gagagagagagagagggggggggggggggggggggggggggg .............');
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Image(image: AssetImage('assets/images/beauty_stall.jpg'),
        ),
      ),
    );
  }
}

Future<bool> isLoggedIn(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('token') ?? '';
  if(token.isNotEmpty) {
    goToHomeScreen(context);
    return true;
  } else {
    goToAppIntro(context);
    return false;
  }
}

void goToHomeScreen(BuildContext context){
  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
}

void goToAppIntro(BuildContext context){
  Navigator.of(context).pushReplacementNamed(AppIntro.routeName);
}