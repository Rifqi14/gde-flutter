import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';


class NfcScan extends StatefulWidget {
  @override
  _NfcScanState createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
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
                    height:300,
                    image: AssetImage("assets/images/nfc_scan.png"),
                  ),
                  SizedBox(height: 36.0),
                  Padding(
                    padding: const EdgeInsets.only(right:75, left:75,),
                    child: Column(
                      children: [
                        Text(
                          'Hold Card',
                          style: TextStyle(
                            color: AppColors.indigo[900],
                            fontFamily: "Mulish",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: 16.0),
                        Text(
                          'Hold card in the back your phone and wait a moment until the scan process is complete',
                          style: TextStyle(
                            color: Color(0XFF868686),
                            fontFamily: "Mulish",
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
