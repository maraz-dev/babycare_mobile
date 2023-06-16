import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/ui/mother_screens/auth/signin.dart';
import 'package:hephzibah/ui/splash_screen/onBoardingOne.dart';
import 'package:hephzibah/ui/splash_screen/onBoardingOneTest.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logos/logo2.png'),
            const SizedBox(height: 30,),
            Text(
              'Digital Clinic',
              style: headerText,
            ),
            const SizedBox(height: 100,),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingOne())),
              child: const Text('DOCTOR SIGN IN'),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MotherSignIn())),
              child: const Text('MOTHER SIGN IN'),
            ),
          ],
        ),
      ),
    );
  }
}
