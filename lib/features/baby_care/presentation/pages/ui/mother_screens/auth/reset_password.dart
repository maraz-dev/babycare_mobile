import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/mother_screens/auth/otp_page.dart';

class MotherResetPassword extends StatelessWidget {
  const MotherResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    nextPageButtonHandler() async {
      await Navigator.push(context, MaterialPageRoute(builder: (context) => const MotherOTPPage()));
    }
    return Scaffold(
      appBar: authAppBar(context, 'Reset Password', '', false, mother: true),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('Please enter your email address. A code will be sent to your email', style: normalText.copyWith(fontSize: 15),),),
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
            const SizedBox(height: 10,),
            ButtonWidget(text: 'CONTINUE', press: () => nextPageButtonHandler(), BackgroundColor: primaryColor, radius: 4,),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
