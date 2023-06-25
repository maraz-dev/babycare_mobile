import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageLayout extends StatelessWidget {
  final String? uid;
  final String type;
  final text;
  final time;
  final color;
  final align;
  final boxAlignment;
  final nip;
  final senderName;
  final senderId;
  final boxMainAxisAlignment;
  const MessageLayout({
    Key? key,
    required this.uid,
    required this.type,
    required this.text,
    required this.time,
    required this.color,
    required this.align,
    required this.boxAlignment,
    required this.nip,
    required this.senderName,
    required this.senderId,
    required this.boxMainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: boxAlignment,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: boxMainAxisAlignment,
          children: [
            color == Colors.blue
                ? Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(55))),
                    child: Image.asset("assets/profile_default.png"),
                  )
                : Text(
                    "",
                    style: TextStyle(fontSize: 0),
                  ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(3),
              child: Bubble(
                color: color,
                nip: nip,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    color == Colors.green[300]
                        ? Text(
                            "Me",
                            textAlign: align,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            senderName,
                            textAlign: align,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        text == "" ? "" : text,
                        textAlign: align,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Text(
                      time,
                      textAlign: align,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            color != Colors.blue
                ? Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(55))),
                    child: Image.asset("assets/profile_default.png"),
                  )
                : Text(
                    "",
                    style: TextStyle(fontSize: 0),
                  ),
          ],
        )
      ],
    );
  }
}
