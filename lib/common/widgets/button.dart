/*
  create constant color for the button and renamed as you want
*/
import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double? radius;
  final press;
  final Color BackgroundColor, textColor;
  const ButtonWidget({
    required this.text,
    required this.press,
    this.radius,
    required this.BackgroundColor,
    this.textColor = Colors.red,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 12),
        child: ElevButton(),
      ),
    );
  }

  Widget ElevButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: BackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w500)),
      child: Text(text),
    );
  }
}

//