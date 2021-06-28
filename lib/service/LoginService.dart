
import 'package:beautystall/service/_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beautystall/Repository/FormRepo.dart';
import 'package:beautystall/models/Login.dart';
import 'package:beautystall/widgets/snackbar.dart';

class LoginService extends Service{
  LoginService({required BuildContext context}) : super(context);

  late Function _goToPageFunc;
  final FormRepo _formRepo = FormRepo();

  Future<bool>  isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    if(token.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> doLogin(String email, String password,
      Function goToPageFunc) async {
    this._goToPageFunc = goToPageFunc;
    _showProgressHud();
    await _formRepo.doLogin(email, password)
        .then((Login login) => _doAfterLogin(login))
        .catchError((Object error) {
            _hideProgressHud();
            showError(error.toString());
          });
  }

  void _doAfterLogin(Login login){
    _hideProgressHud();
    if(login.token.isNotEmpty){//login success
      setToken(login.token);
      _goToPageFunc();
    } else {
      if(login.errors.isNotEmpty){
        showError(login.errors);
      }
    }
  }

  void _showProgressHud(){
    final progressHud = ProgressHUD.of(context!);
    progressHud?.show();
  }

  void _hideProgressHud(){
    final progressHud = ProgressHUD.of(context!);
    progressHud?.dismiss();
  }

  Future<void> setToken(String? token) async {
// obtain shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// set value
    prefs.setString('token', token!);
  }


}