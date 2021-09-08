import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';
import 'package:get/get.dart';

import 'package:whatsapp/ui/screens/list_inventory.dart';

class BorrowingRequest extends StatefulWidget {
  @override
  _BorrowingRequestState createState() => _BorrowingRequestState();
}

class _BorrowingRequestState extends State<BorrowingRequest> {
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
  List<int> _n = [0, 0, 0, 0];

  void _incrementCounter(int index) {
    setState(() {
      _n[index]++;
    });
  }

  void _incrementRemove(int index) {
    setState(() {
      if (_n[index] != 0) _n[index]--;
    });
  }

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
            "Borrowing Requests",
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Row(
                children: [
                  AvatarImage(
                    imageProvider: AssetImage("assets/images/profile.png"),
                    radius: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Lucy Heathfilia",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Mulish",
                              ),
                            ),
                            SizedBox(height: 9.0),
                            Text(
                              "Employee",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.normal,
                                color: Color(0XFF868686),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Product List",
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
                height: 480.0,
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
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        left: 5,
                                        right: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 70,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 70,
                                                  child: Text(
                                                    product[index].productName,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: "Mulish",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    product[index].productDate,
                                                    style: TextStyle(
                                                      fontSize: 9,
                                                      fontFamily: "Mulish",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 30,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5),
                                                  child: Container(
                                                    height: 60,
                                                    child: Text(
                                                      "Stock: 5",
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                        fontFamily: "Mulish",
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        _incrementRemove(index);
                                                      },
                                                      child: Container(
                                                        height: 15,
                                                        width: 15,
                                                        child: Icon(
                                                            Icons.remove,
                                                            color: Colors.black,
                                                            size: 14),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 30,
                                                      child: Center(
                                                        child: Text(
                                                          _n[index].toString(),
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                "Mulish",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      //onTap: _incrementCounter(),
                                                      onTap: () {
                                                        _incrementCounter(
                                                            index);
                                                      },
                                                      child: Container(
                                                        height: 15,
                                                        width: 15,
                                                        child: Icon(Icons.add,
                                                            color: Colors.black,
                                                            size: 14),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
            SizedBox(height: 26.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Row(
                crossAxisAlignment:  CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Reject',
                            style: TextStyle(
                              color: AppColors.indigo[900],
                              fontFamily: "Mulish",
                              fontSize: 14,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XFFF5F6FA),
                            side: BorderSide(
                              width: 1.3,
                              color: AppColors.indigo[900],
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 35,
                              vertical: 13,
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                            ),
                            
                          ),
                        ),
                        SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Mulish",
                              fontSize: 14,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.indigo[900],
                            side: BorderSide(
                              width: 1.3,
                              color: AppColors.indigo[900],
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 91,
                              vertical: 13,
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                            ),
                          ),
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

class AvatarImage extends StatelessWidget {
  AvatarImage({
    @required this.imageProvider,
    this.radius = 10,
  });

  final double radius;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: radius,
            backgroundImage: imageProvider,
          ),
        ],
      ),
    );
  }
}
