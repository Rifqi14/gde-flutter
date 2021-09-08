import 'package:flutter/material.dart';
import 'package:whatsapp/core/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Widget _logo() {
  return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Image.asset(
        "assets/images/logo_gde.png",
        width: 200,
        height: 200,
      ));
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0097, 1.0871],
          colors: [
            Color(0XFF66A3FF),
            Color(0XFF13117E),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: _logo()),
      ),
    );
  }
}
