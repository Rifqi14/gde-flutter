import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';
import 'package:whatsapp/core/controllers/user_controller.dart';
import 'package:whatsapp/core/utils/validate_util.dart';
import 'package:whatsapp/ui/screens/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final cEmail = TextEditingController();
  final cPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  int _state = 0;
  @override
  void initState() {
    super.initState();
  }

  Widget _logogde() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Image.asset(
        "assets/images/logo_gde.png",
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _welcome() {
    return Text(
      "Welcome Back!",
      style: TextStyle(
        color: AppColors.indigo[900],
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
    );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Text(
        "Get prepare and login using you’re account",
        style: TextStyle(
          color: Color(0XFF868686),
          fontWeight: FontWeight.w300,
          fontSize: 12.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _username() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Username",
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            validator: (value) {
              return ValidateUtils.requiredField(value, 'Username is required');
            },
            decoration: InputDecoration(
              hintText: "Insert your username",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17.0, vertical: 11.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFFB9B9BB),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFF000000),
                  width: 1,
                ),
              ),
            ),
            controller: cEmail,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }

  Widget _passwordNew() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Password"),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            obscureText: !this._showPassword,
            validator: (value) {
              return ValidateUtils.requiredField(value, 'Password is required');
            },
            decoration: InputDecoration(
              hintText: "Insert your password",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => this._showPassword = !this._showPassword);
                },
                icon: Icon(
                  this._showPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Color(0XFFB9B9BB),
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17.0, vertical: 11.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFFB9B9BB),
                  width: 1,
                ),
              ),
               errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFF000000),
                  width: 1,
                ),
              ),
            ),
            controller: cPassword,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Login",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }

  Widget _login() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: MaterialButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              FocusScope.of(context).unfocus();
              if (_formKey.currentState.validate()) {
                UserController.to.login(
                  email: cEmail.text.trim(),
                  password: cPassword.text.trim(),
                );
              }
            }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          textColor: Colors.white,
          color: AppColors.indigo[900],
          height: 50,
          minWidth: double.infinity,
          padding: const EdgeInsets.all(0),
          child: setUpButtonChild()),
    );
  }

  Widget _register() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
          child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: GoogleFonts.roboto(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(243, 156, 18, 1.0),
            ),
            children: [
              TextSpan(
                text: 'Dont have account? ',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              TextSpan(
                text: 'Register',
                style: TextStyle(
                    color: Color.fromRGBO(1, 166, 90, 1.0), fontSize: 16.0),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(() => RegisterScreen());
                  },
              ),
            ]),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimens.vertical_padding,
                horizontal: Dimens.horizontal_padding),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _logogde(),
                  SizedBox(
                    height: 50.0,
                  ),
                  _welcome(),
                  SizedBox(
                    height: 8.0,
                  ),
                  _info(),
                  SizedBox(
                    height: 72.0,
                  ),
                  _username(),
                  SizedBox(
                    height: 16.0,
                  ),
                  _passwordNew(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _login(),
                  SizedBox(
                    height: 19.0,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0XFF868686),
                        fontWeight: FontWeight.w300,
                        fontSize: 14.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Don’t have account? ",
                        ),
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: AppColors.indigo[900],
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen())),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 47.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
