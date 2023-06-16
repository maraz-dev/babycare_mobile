import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/ui/doctor_screens/auth/reset_password.dart';
import 'package:hephzibah/ui/doctor_screens/auth/signin.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _hospitalController = TextEditingController();
    TextEditingController _experienceController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(context, 'Sign Up', 'Please enter your credentials to proceed', true),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Name', style: normalText.copyWith(fontSize: 15),),),
              CustomTextInput(
                textEditController: _nameController,
                hintTextString: ' Name',
                inputType: InputType.Default,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Email', style: normalText.copyWith(fontSize: 15),),),
              CustomTextInput(
                textEditController: _emailController,
                hintTextString: ' Email',
                inputType: InputType.Email,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Mobile Phone', style: normalText.copyWith(fontSize: 15),),),
              CustomTextInput(
                textEditController: _phoneController,
                hintTextString: 'Mobile Number ',
                inputType: InputType.Number,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Current Hospital', style: normalText.copyWith(fontSize: 15),),),
              CustomTextInput(
                textEditController: _hospitalController,
                hintTextString: 'Current Hospital',
                inputType: InputType.Default,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Years Of Experience', style: normalText.copyWith(fontSize: 15),),),
              CustomTextInput(
                textEditController: _experienceController,
                hintTextString: 'Years of Experience',
                inputType: InputType.Default,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Password', style: normalText.copyWith(fontSize: 15),),),
              CustomTextInput(
                textEditController: _passwordController,
                hintTextString: 'Password',
                inputType: InputType.Password,
                cornerRadius: 5,
                themeColor: lightPrimaryColor,
              ),
              const SizedBox(height: 10,),
              ButtonWidget(text: 'LOGIN', press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword())), BackgroundColor: primaryColor, radius: 4,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Already have an account? ', style: normalText.copyWith(fontSize: 15),),
                  InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword())),
                      child: Text('Log In', style: normalText.copyWith(fontSize: 15, color: primaryColor),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
