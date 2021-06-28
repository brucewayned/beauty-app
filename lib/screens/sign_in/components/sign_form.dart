import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:beautystall/components/custom_surfix_icon.dart';
import 'package:beautystall/components/form_error.dart';
import 'package:beautystall/service/LoginService.dart';
import 'package:beautystall/helper/keyboard.dart';
import 'package:beautystall/screens/forgot_password/forgot_password_screen.dart';
import 'package:beautystall/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    Key key1 = UniqueKey();
    Key key2 = UniqueKey();
    LoginService loginService;

    return Form(
      key: _formKey,
        child: ProgressHUD(
          child: Builder(
            builder: (BuildContext  _context) {
              loginService = new LoginService(context: _context);
              return Center(
                child: Column(
                  children: [
                    buildEmailFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildPasswordFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      children: [
                        Checkbox(
                          value: remember,
                          activeColor: kPrimaryColor,
                          onChanged: (value) {
                            setState(() {
                              remember = value!;
                            });
                          },
                        ),
                        Text("Remember me"),
                        Spacer(),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(
                                  context, ForgotPasswordScreen.routeName),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    FormError(errors: errors, key: key1,),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // if all are valid then go to success screen
                          KeyboardUtil.hideKeyboard(context);
                          loginService.doLogin(email, password, goToSuccessPage);
                        }
                      }, key: key2,
                    ),
                  ],
                ),
              );
            }
          )
        )
    );
  }

  void goToSuccessPage(){
    Navigator.pushNamedAndRemoveUntil(context, LoginSuccessScreen.routeName, (r) => false);
  }

  TextFormField buildPasswordFormField() {
    Key key3 = UniqueKey();

    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg", key: key3,),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    Key key4 = new UniqueKey();

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg", key: key4,),
      ),
    );
  }
}
