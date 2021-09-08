import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation ({
    @required this.icon,
    this.iconActive,
    this.isActive = false,
    this.onTap,
    Key key,
  }) : super(key: key);

  final AssetImage icon;
  final AssetImage iconActive;
  final Function onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(7),
          child: Column(
            children: <Widget>[
              isActive
                  ? iconActive != null
                      ? Image(
                          image: iconActive,
                          height: 30,
                          width: 30,
                          fit: BoxFit.fill,
                          color: isActive
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        )
                      : Image(
                          image: icon,
                          height: 30,
                          width: 30,
                          fit: BoxFit.fill,
                          color: isActive
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        )
                  : Image(
                      image: icon,
                      height: 30,
                      width: 30,
                      fit: BoxFit.fill,
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
             
            ],
          ),
        ),
      ),
    );
  }
}
const kGrabBlackBoldSmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.black,
);
