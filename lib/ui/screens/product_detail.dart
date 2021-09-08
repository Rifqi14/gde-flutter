import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/constant/dimens.dart';


class DetailProduct extends StatefulWidget {
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
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
            "Product Detail",
            style: TextStyle(
              fontSize: 18.0,
               fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
              color: AppColors.indigo[900],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
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
              child: CardProduct(),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Text(
                "Office Chair, Smiding black",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish",
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Row(
                children: [
                  Text(
                    "90 Stock",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                      color: Color(0XFF8A8A8E),
                    ),
                  ),
                  Text(
                    "  |  ",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Mulish",
                      color: Color(0XFF8A8A8E),
                    ),
                  ),
                  Text(
                    "42 Availabe",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                      color: Color(0XFF8A8A8E),
                    ),
                  ),
                  Text(
                    "  |  ",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Mulish",
                      color: Color(0XFF8A8A8E),
                    ),
                  ),
                  Text(
                    "48 Borrowed",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish",
                      color: Color(0XFF8A8A8E),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Text(
                "Product Description",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish",
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontal_padding,
              ),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, faucibus vel imperdiet dictum imperdiet tempor hac. Orci semper fermentum, vitae, aliquam sem lectus velit. Lectus nisl massa a tristique. Non, gravida imperdiet massa quis vel morbi viverra elementum. Tincidunt amet, egestas at in. At lorem risus morbi praesent. Vitae nibh ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Mulish",
                  color: Color(0XFF8A8A8E),
                ),
                textAlign: TextAlign.left,
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

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 318.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFFFCFF6D),
                      Color(0XFFFFB800),
                    ],
                    stops: [
                      0.0813,
                      0.8017,
                    ],
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
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/chair.png",
                              fit: BoxFit.fill,
                              height: 217,
                            ),
                          ],
                        ),
                      ),
                    ],
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
