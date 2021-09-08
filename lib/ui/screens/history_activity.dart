import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';
import 'package:get/get.dart';

import 'package:whatsapp/core/controllers/user_controller.dart';
import 'package:whatsapp/ui/screens/list_inventory.dart';
import 'package:whatsapp/ui/screens/nfc_failed.dart';
import 'package:whatsapp/ui/screens/nfc_process.dart';
import 'package:whatsapp/ui/screens/nfc_scan.dart';

class HistoryActivity extends StatefulWidget {
  @override
  _HistoryActivityState createState() => _HistoryActivityState();
}

class _HistoryActivityState extends State<HistoryActivity> {
  final List<Products> product = [
    Products(
        productId: 1,
        productName: "Samsung Galaxy note",
        productImage: "assets/images/dummy_product.png",
        productDate: "12 May 2021",
        productQty: "2"),
    Products(
        productId: 2,
        productName: "Iphone 12 Pro Max",
        productImage: "assets/images/dummy_product.png",
        productDate: "14 Dec 2021",
        productQty: "2"),
    Products(
        productId: 3,
        productName: "Xiomi",
        productImage: "assets/images/dummy_product.png",
        productDate: "17 Aug 2021",
        productQty: "2"),
    Products(
        productId: 4,
        productName: "Vivo",
        productImage: "assets/images/dummy_product.png",
        productDate: "17 Aug 2021",
        productQty: "2"),
  ];
  dynamic ringkasanRange;

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
            "History Activity",
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
          vertical: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: DropdownButton<String>(
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'This_Week',
                          child: Text(
                            'Week',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'This_Month',
                          child: Text(
                            'Month',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'This_Year',
                          child: Text(
                            'Year',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                      underline: Container(),
                      value: ringkasanRange,
                      hint: Text(
                        'Select',
                        style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      onChanged: (dynamic value) {
                        setState(() {
                          ringkasanRange = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DropdownButton<String>(
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'This_Week',
                          child: Text(
                            'Week',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'This_Month',
                          child: Text(
                            'Month',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'This_Year',
                          child: Text(
                            'Year',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                      underline: Container(),
                      value: ringkasanRange,
                      hint: Text(
                        '17 Aug 2021',
                        style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      onChanged: (dynamic value) {
                        setState(() {
                          ringkasanRange = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: CardProductInOut(),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Activity History",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                        fontFamily: "Mulish",
                        color: AppColors.indigo[900],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: SizedBox(
                height: 400.0,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 40,
                              child: Container(
                                child: Image(
                                  image: AssetImage(
                                    product[index].productImage,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, left: 5),
                                    child: Container(
                                      height: 15,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 80,
                                            child: Text(
                                              "Webmaster",
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontFamily: "Mulish",
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 20,
                                            child: Container(
                                              height: 12,
                                              decoration: BoxDecoration(
                                                color: Colors.red[800],
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: Container(
                                      height: 45,
                                      child: Text(
                                        product[index].productName,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 80,
                                          child: Text(
                                            product[index].productDate,
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontFamily: "Mulish",
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 20,
                                          child: Text(
                                            'x' + product[index].productQty,
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontFamily: "Mulish",
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Products {
  final int productId;
  final String productName;
  final String productDate;
  final String productQty;
  final String productImage;

  Products(
      {@required this.productName,
      @required this.productDate,
      @required this.productImage,
      @required this.productQty,
      @required this.productId});
}

class CardProductInOut extends StatelessWidget {
  const CardProductInOut({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ListInventory());
                },
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFFFF6666),
                        Color(0XFF7E1111),
                      ],
                      stops: [0.0097, 1.0871],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "21",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Inventory Total",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/icon/data.png",
                                fit: BoxFit.fill,
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => NfcScan());
                },
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFFFFF966),
                        Color(0XFF7E5311),
                      ],
                      stops: [0.0097, 1.0871],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "40",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Transfer",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/icon/arrow.png",
                                fit: BoxFit.fill,
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                 onTap: () {
                  Get.to(() => NfcFailed());
                },
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFF7BFF66),
                        Color(0XFF117E4A),
                      ],
                      stops: [0.0097, 1.0871],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "32",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Consumeable",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/icon/cloude.png",
                                fit: BoxFit.fill,
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => NfcProcess());
                },
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFF619AF7),
                        Color(0XFF1E248F),
                      ],
                      stops: [0.0097, 1.0871],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "95",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Borrowing",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/icon/user.png",
                                fit: BoxFit.fill,
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
