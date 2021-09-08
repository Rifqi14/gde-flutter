import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Text buttonText;
  final Color buttonColor;
  final TextStyle buttonTextStyle;
  final VoidCallback buttonEvent;

  const ButtonWidget({
    Key key,
    @required this.buttonText,
    @required this.buttonColor,
    @required this.buttonTextStyle,
    @required this.buttonEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonEvent,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        textStyle: buttonTextStyle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        minimumSize: Size(double.infinity, 50.0),
      ),
      child: buttonText,
    );
  }
}