
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beautystall/Repository/FormRepo.dart';
import 'package:beautystall/models/Login.dart';
import 'package:beautystall/widgets/snackbar.dart';

class LoginController{
  LoginController(BuildContext _context){
    this._context = _context;
  }

  BuildContext? _context;

  late Function _goToPageFunc;
  final FormRepo _formRepo = FormRepo();

  Future<void> doLogin(String email, String password,
      Function goToPageFunc) async {
    this._goToPageFunc = goToPageFunc;
    _showProgressHud(_context!);
    await _formRepo.doLogin(email, password)
        .then((Login login) => _doAfterLogin(login))
        .catchError((Object error) => _showError(error.toString()));
  }

  void _doAfterLogin(Login login){
    _hideProgressHud(_context!);
    if(login.token.isNotEmpty){//login success
      setToken(login.token);
      _goToPageFunc();
    } else {
      if(login.errors.isNotEmpty){
        _showError(login.errors);
      }
    }
  }

  void _showProgressHud(BuildContext buildContext){
    final progressHud = ProgressHUD.of(_context!);
    progressHud?.show();
  }

  void _hideProgressHud(BuildContext _context){
    final progressHud = ProgressHUD.of(_context);
    progressHud?.dismiss();
  }

  void _toggleSnackBar(String? text){
    CustomSnackBar(_context!, Text(text!),
        snackBarAction: SnackBarAction(label: '', onPressed: () {  },));
  }

  void _showError(String? error){
    _toggleSnackBar(error);
    _hideProgressHud(_context!);
  }


  Future<void> setToken(String? token) async {
// obtain shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// set value
    prefs.setString('token', token!);
  }


}