import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/ui/doctor_screens/auth/signup.dart';
import 'package:hephzibah/ui/mother_screens/auth/baby_reg.dart';
class MotherNewPassword extends StatelessWidget {
  const MotherNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _codeController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(context, 'New Password', 'Create a new password', false, mother: true),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('New Password', style: normalText.copyWith(fontSize: 15),),),
            CustomTextInput(
              textEditController: _codeController,
              hintTextString: 'Password',
              inputType: InputType.Password,
              cornerRadius: 5,
              themeColor: lightPrimaryColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('Repeat Password', style: normalText.copyWith(fontSize: 15),),),
            CustomTextInput(
              textEditController: _codeController,
              hintTextString: 'Repeat Password',
              inputType: InputType.Password,
              cornerRadius: 5,
              themeColor: lightPrimaryColor,
              enabled: false,
            ),
            const SizedBox(height: 10,),
            ButtonWidget(text: 'CONTINUE', press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BabyRegistration())), BackgroundColor: primaryColor, radius: 4,),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
