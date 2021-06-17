import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/core/controllers/user_controller.dart';
import 'package:whatsapp/core/utils/validate_util.dart';
import 'package:whatsapp/ui/screens/register.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final cPhone = TextEditingController();
  final cPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  int _state = 0;
  @override
  void initState() {
    super.initState();
  }
  
  Widget _logo() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child:  Image.asset(
          "assets/images/logo.png",
          width: 150,
          height: 150,
        )
      );
  }
   Widget _welcome() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: GoogleFonts.roboto(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Welcome!',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ]),
          )
      );
  }
  Widget _exist() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 5.0),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
                children: [
                  TextSpan(
                    text: 'Login to your existing account.',
                    style: TextStyle(color: Color.fromRGBO(62, 62, 63, 1.0), fontSize: 14.0),
                  ),
                ]),
          )
      );
  }
  Widget _phone(){
    return Container(
        alignment: Alignment.center,
        child: TextFormField(
          validator: (value) {
            return ValidateUtils.requiredField(value, 'Username is required');
          },
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.people),
            contentPadding: const EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.20), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Color.fromRGBO(1, 166, 90, 1.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          controller: cPhone,
          textInputAction: TextInputAction.next,
        ),
      );
  }

  Widget _password(){
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: !this._showPassword,
        validator: (value) {
          return ValidateUtils.requiredField(value, 'Password is required');
        },
        decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: Icon(Icons.lock),
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.20), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color.fromRGBO(1, 166, 90, 1.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              this._showPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() => this._showPassword = !this._showPassword);
            },
          ),
        ),
        controller: cPassword,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Login",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0
        ),
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
  Widget _login(){
    return  Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                FocusScope.of(context).unfocus();
                  if (_formKey.currentState.validate()) {
                    UserController.to.login(
                      phone: cPhone.text.trim(),
                      password: cPassword.text.trim(),
                    );
                  }
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        textColor: Colors.white,
        color: Color.fromRGBO(1, 166, 90, 1.0),
        height: 50,
        minWidth: double.infinity,
        padding: const EdgeInsets.all(0),
        child: setUpButtonChild()
      ),
    );
  }

  Widget _register(){
    return  Container(
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
                    style: TextStyle(color: Color.fromRGBO(1, 166, 90, 1.0), fontSize: 16.0),
                    recognizer: TapGestureRecognizer()..onTap = () {
                        Get.to(() => RegisterScreen());
                    },
                  ),
                ]),
          )
        ),
      );
  }

  Widget _divider(){
    Size size = MediaQuery.of(context).size;
    return SizedBox(height: size.height * 0.01);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
                margin: EdgeInsets.only(left: 0, right: 0, top: size.height*0.12,bottom: 0),
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _logo(),
                      _welcome(),
                      _exist(),
                      _divider(),
                      new Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,bottom: 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 5.0),
                                blurRadius: 5.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 5.0),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0,bottom: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _phone(),
                            _divider(),
                            _password(),
                            _divider(),
                            _login(),
                            _register()
                          ]
                        )
                        )
                      ),
                      new Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.0,vertical: 1),
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero,bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0,5),
                                blurRadius: 5.0),
                          ]),
                      )
                    ],
                  ),
                )
           )
        )
      )
    );
  }
}