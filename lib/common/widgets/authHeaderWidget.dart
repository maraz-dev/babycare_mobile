import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(280),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onboard1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Text on App Bar Area',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

authAppBar(BuildContext context, String title, String description, bool image,
    {bool? mother = false}) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return PreferredSize(
  preferredSize: const Size.fromHeight(280),
  child: Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/headBackground.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Row(
      children: [
      Container(
        width: image == true ? width * 0.5 : width,
        padding: const EdgeInsets.only(top: 20, left: 20, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/logos/logo1.png', width: 50,),
            const SizedBox(height: 40,),
            Text(title, style: headerText.copyWith(color: Colors.white),),
            const SizedBox(height: 20,),
            Text(description, style: normalText.copyWith(color: Colors.white, fontSize: 15),),
          ],
        ),
      ),
      image == true ? Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: width * 0.5,
                child: Image.asset(mother != true ? 'assets/doctor.png' : 'assets/mother.png', fit: BoxFit.fill,)),
          ],
        ) : const Text(''),
    ],),
  ),
);
}