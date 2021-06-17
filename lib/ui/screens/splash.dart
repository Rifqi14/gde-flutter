import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
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
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logo()
              ],
            )
          ,
        )
      );
  }
}