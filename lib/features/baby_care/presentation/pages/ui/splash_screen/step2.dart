import 'package:flutter/material.dart';
import '../../../../../../common/commons.dart';
import '../doctor_screens/auth/signin.dart';
import '../doctor_screens/auth/signup.dart';
import '../mother_screens/auth/signin.dart';
import '../mother_screens/auth/signup.dart';

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
            const SizedBox(
              height: 30,
            ),
            Text(
              'PregnancyPal',
              style: headerText,
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SignIn())),
              child: const Text('DOCTOR SIGN IN'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MotherSignIn())),
              child: const Text('MOTHER SIGN IN'),
            ),
          ],
        ),
      ),
    );
  }
}

class StepThree extends StatelessWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logos/logo2.png'),
            const SizedBox(
              height: 30,
            ),
            Text(
              'PregnancyPal',
              style: headerText,
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SignUp())),
              child: const Text('DOCTOR SIGN UP'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MotherSignUp())),
              child: const Text('MOTHER SIGN UP'),
            ),
          ],
        ),
      ),
    );
  }
}
