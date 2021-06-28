
import 'package:beautystall/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class Service{
  Service(BuildContext _context){
    this.context = _context;
  }

  BuildContext? context;

  void toggleSnackBar(String? text){
    CustomSnackBar(context!, Text(text!),
        snackBarAction: SnackBarAction(label: '', onPressed: () {  },));
  }

  void showError(String? error){
    toggleSnackBar(error);
  }


}