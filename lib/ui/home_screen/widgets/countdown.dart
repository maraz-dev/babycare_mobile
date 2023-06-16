import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
class CountDownWidget extends StatelessWidget {
  const CountDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        shadowColor: lightPrimaryColor,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                color: primaryColor.withOpacity(0.08),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 30),
                child: Icon(Icons.watch_later_outlined, color: primaryColor,size: 30,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Countdown to Next Appointment', style: headerText.copyWith(fontSize: 16, fontWeight: FontWeight.w500),),
                  Text(' 00:00:00 ', style: headerText.copyWith(fontSize: 36,),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
