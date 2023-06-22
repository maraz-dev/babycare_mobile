import 'package:flutter/material.dart';
import '../../../../../../../common/commons.dart';
import '../../../../../../../common/widgets/authHeaderWidget.dart';
import '../../../../../../../common/widgets/button.dart';
import '../../../../../../../common/widgets/custom_text_input.dart';
import 'otp_page.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    nextPageButtonHandler() async {
      await Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPPage()));
    }
    return Scaffold(
      appBar: authAppBar(context, 'Reset Password', '', false),
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
