import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';
import 'dart:async';
import 'package:whatsapp/ui/screens/login.dart';
import 'package:whatsapp/ui/widgets/button_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  int _value = 1;
  int _state = 0;
  @override
  void initState() {
    super.initState();
  }

  Widget _signup() {
    return Text(
      "Get Started",
      style: TextStyle(
        color: AppColors.indigo[900],
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
    );
  }

  Widget _new() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Text(
        "Let’s we setup you’re account.",
        style: TextStyle(
          color: Color(0XFF868686),
          fontWeight: FontWeight.w300,
          fontSize: 12.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _role() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Role",
          ),
          SizedBox(
            height: 8.0,
          ),
          DropdownButtonFormField(
            value: _value,
            items: [
              DropdownMenuItem(child: Text("Administrator"), value: 1),
              DropdownMenuItem(child: Text("Webmaster"), value: 2)
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            hint: Text("Select Role"),
            isExpanded: true,
            decoration: InputDecoration(
              hintText: "Insert your username here",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17.0, vertical: 11.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFFB9B9BB),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFF000000),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _email() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (value) {
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
            borderSide:
                BorderSide(color: Color.fromRGBO(0, 0, 0, 0.20), width: 1),
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
            decoration: InputDecoration(
              hintText: "Insert your username here",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17.0, vertical: 11.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFFB9B9BB),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFF000000),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _password() {
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
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFF000000),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _repassword() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Confirmation Password"),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            obscureText: !this._showPassword,
            decoration: InputDecoration(
              hintText: "Confirmation password",
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
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0XFF000000),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Register",
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

  Widget _register() {
    Size size = MediaQuery.of(context).size;
    return Container(
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

  Widget _login() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Color(0XFF868686),
          fontWeight: FontWeight.w300,
          fontSize: 14.0,
        ),
        children: [
          TextSpan(
            text: "Already have account? ",
          ),
          TextSpan(
            text: "Login",
            style: TextStyle(
              color: AppColors.indigo[900],
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pop(context),
          ),
        ],
      ),
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
              vertical: 0.0,
              horizontal: Dimens.horizontal_padding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 123.0,
                ),
                _signup(),
                SizedBox(
                  height: 8.0,
                ),
                _new(),
                SizedBox(
                  height: 72.0,
                ),
                _username(),
                SizedBox(
                  height: 16.0,
                ),
                _role(),
                SizedBox(
                  height: 16.0,
                ),
                _password(),
                SizedBox(
                  height: 16.0,
                ),
                _repassword(),
                SizedBox(
                  height: 19.0,
                ),
                _register(),
                SizedBox(
                  height: 19.0,
                ),
                 _login(),
                 SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          )),
    )));
  }
}
