import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/ui/home_screen/home_page.dart';
import 'package:hephzibah/ui/mother_screens/auth/signup.dart';

class MotherSignIn extends StatelessWidget {
  const MotherSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(
          context, 'Sign In', 'Please enter your credentials to proceed', true,
          mother: true),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Email',
                style: normalText.copyWith(fontSize: 15),
              ),
            ),
            CustomTextInput(
              textEditController: _emailController,
              hintTextString: ' Email',
              inputType: InputType.Email,
              cornerRadius: 5,
              themeColor: lightPrimaryColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Password',
                style: normalText.copyWith(fontSize: 15),
              ),
            ),
            CustomTextInput(
              textEditController: _passwordController,
              hintTextString: 'Password',
              inputType: InputType.Password,
              cornerRadius: 5,
              themeColor: lightPrimaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'Forget Password',
              style: normalText,
            )),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              text: 'LOGIN',
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              BackgroundColor: primaryColor,
              radius: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'OR',
              style: normalText.copyWith(fontSize: 18),
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Don’t have an account? ',
                  style: normalText.copyWith(fontSize: 15),
                ),
                InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MotherSignUp())),
                    child: Text(
                      'Sign Up',
                      style: normalText.copyWith(
                          fontSize: 15, color: primaryColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
