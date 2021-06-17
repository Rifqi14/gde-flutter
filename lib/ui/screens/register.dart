import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:whatsapp/ui/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  int _state = 0;
  @override
  void initState() {
    super.initState();
  }
  Widget _signup() {
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
                    text: 'Register',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ]),
          )
      );
  }
  Widget _new() {
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
                    text: 'Create new account.',
                    style: TextStyle(color: Color.fromRGBO(62, 62, 63, 1.0), fontSize: 14.0),
                  ),
                ]),
          )
      );
  }
  Widget _name(){
    return Container(
        alignment: Alignment.center,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onChanged: (value){
            if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
            }
          },
          decoration: InputDecoration(
            labelText: 'Name',
            prefixIcon: Icon(Icons.edit),
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
          ),
        ),
      );
  }

Widget _email(){
    return Container(
        alignment: Alignment.center,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onChanged: (value){
            if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
            }
          },
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.mail),
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
          ),
        ),
      );
  }
  
  Widget _username(){
    return Container(
        alignment: Alignment.center,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onChanged: (value){
            if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
            }
          },
          decoration: InputDecoration(
            labelText: 'Phone',
            prefixIcon: Icon(Icons.phone_android),
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
          ),
        ),
      );
  }

  Widget _password(){
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: !this._showPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (value){
          if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
          }
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
      ),
    );
  }

Widget _repassword(){
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: !this._showPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (value){
          if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
          }
        },
        decoration: InputDecoration(
          labelText: "Re-Password",
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
      ),
    );
  }
  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Register",
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

  Widget _privacy(){
    return  Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Color.fromRGBO(1, 166, 90, 1.0),
                ),
                children: [
                  TextSpan(
                    text: 'I hereby agree ',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Terms and Conditions ',
                    style: TextStyle(color: Color.fromRGBO(1, 166, 90, 1.0), fontSize: 14),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Privacy Policy ',
                    style: TextStyle(color: Color.fromRGBO(1, 166, 90, 1.0), fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Whatsapp',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ]),
          )
        ),
      );
  }
  Widget _register(){
    Size size = MediaQuery.of(context).size;
    return  Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                });
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

  Widget _login(){
    return  Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 166, 90, 1.0),
                ),
                children: [
                  TextSpan(
                    text: 'Already have account? ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(color: Color.fromRGBO(1, 166, 90, 1.0), fontSize: 16),
                    recognizer: TapGestureRecognizer()..onTap = () {
                        Get.to(() => LoginScreen());
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
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new InkWell(
          borderRadius: BorderRadius.circular(30.0),
          child: new Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onTap: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
            child:SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _signup(),
                        _new(),
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
                                _name(),
                                _divider(),
                                _email(),
                                _divider(),
                                _username(),
                                _divider(),
                                _password(),
                                _divider(),
                                _repassword(),
                                _divider(),
                                SizedBox(height: size.height * 0.01),
                                _register(),
                                _login()
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
                ),
            )
          )
    );
  }
}