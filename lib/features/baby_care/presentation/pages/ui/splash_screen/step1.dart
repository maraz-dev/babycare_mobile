import 'package:flutter/material.dart';
import '../../../../../../common/commons.dart';
import 'step2.dart';

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StepTwo())),
              child: const Text('LOGIN'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: style,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StepThree())),
              child: const Text('SIGN UP'),
            ),
          ],
        ),
      ),
    );
  }
}
