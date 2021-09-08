import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';

class NfcFailed extends StatefulWidget {
  @override
  _NfcFailedState createState() => _NfcFailedState();
}

class _NfcFailedState extends State<NfcFailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFFF5F6FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Color(0XFF868686),
              size: 24.0,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "NFC Scan",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
              color: AppColors.indigo[900],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Column(
                children: [
                  Image(
                    height: 300,
                    image: AssetImage("assets/images/nfc_failed.png"),
                  ),
                  SizedBox(height: 36.0),
                  Text(
                    'Card Does’t Match',
                    style: TextStyle(
                      color: AppColors.indigo[900],
                      fontFamily: "Mulish",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(right:75, left: 75),
                    child: Text(
                      'Sorry your card doest match, please try again',
                      style: TextStyle(
                        color: Color(0XFF868686),
                        fontFamily: "Mulish",
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
