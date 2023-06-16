import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
class KnowledgeCenterWidget extends StatelessWidget {
  final press;
  const KnowledgeCenterWidget({Key? key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(25),
        //margin: EdgeInsets.symmetric(vertical: 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(image: AssetImage('assets/dog.png'))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('12 Jul 2020', style: normalText.copyWith(color: Colors.white, fontSize: 10),),
            Spacer(),
            Text('Dogs are carrying the virus', style: headerText.copyWith(color: Colors.white, fontSize: 22),),
            Text('Some Description', style: normalText.copyWith(color: Colors.white, fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
