import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';
import 'package:whatsapp/ui/screens/product_detail.dart';

class ListInventory extends StatefulWidget {
  @override
  _ListInventoryState createState() => _ListInventoryState();
}

class _ListInventoryState extends State<ListInventory> {
  final List<Products> product = [
    Products(
        productId: 1,
        productName: "Samsung Galaxy noteS",
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
            "List Inventory",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: AppColors.indigo[900],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(
                "assets/images/icon/tag.png",
                width: 25,
                height: 25,
              ),
            ),
          ],
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
                  Expanded(
                    flex: 60,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Mulish",
                        ),
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: Colors.grey[300],
                          filled: true,
                          suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black54,
                              ),
                              onPressed: () {}),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 20,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: DropdownButton<String>(
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'Za',
                            child: Text(
                              'Week',
                              style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 13,
                              ),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Za',
                            child: Text(
                              'Za',
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
                          'Az',
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
                  ),
                  Expanded(
                    flex: 20,
                    child: Align(
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
                          'Latest',
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => DetailProduct());
                },
                child: SizedBox(
                  height: 600.0,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          height: 80,
                          width: 80,
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
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 5),
                                      child: Container(
                                        height: 40,
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
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0XFF66A3FF),
                  Color(0XFF13117E),
                ],
                stops: [0.0097, 1.0871],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "120",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Product In",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
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
                        Icon(
                          Icons.south_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Container(
            height: 100.0,
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
              padding: const EdgeInsets.all(14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "90",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Product Out",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
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
                        Icon(
                          Icons.north_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
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
