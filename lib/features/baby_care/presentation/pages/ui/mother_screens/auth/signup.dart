import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/home_screen/home_page.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/mother_screens/auth/baby_reg.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/mother_screens/auth/signin.dart';

class MotherSignUp extends StatelessWidget {
  const MotherSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _hospitalController = TextEditingController();
    TextEditingController _experienceController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(
          context, 'Sign Up', 'Please enter your credentials to proceed', true,
          mother: true),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Name',
                  style: normalText.copyWith(fontSize: 15),
                ),
              ),
              CustomTextInput(
                textEditController: _nameController,
                hintTextString: ' Name',
                inputType: InputType.Default,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
              ),
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
                  'Mobile Phone',
                  style: normalText.copyWith(fontSize: 15),
                ),
              ),
              CustomTextInput(
                textEditController: _phoneController,
                hintTextString: 'Mobile Number ',
                inputType: InputType.Number,
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
              ButtonWidget(
                text: 'SIGN UP',
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BabyRegistration())),
                BackgroundColor: primaryColor,
                radius: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Already have an account? ',
                    style: normalText.copyWith(fontSize: 15),
                  ),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MotherSignIn())),
                      child: Text(
                        'Log In',
                        style: normalText.copyWith(
                            fontSize: 15, color: primaryColor),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
