import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/doctor_screens/auth/new_password.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/mother_screens/auth/new_password.dart';
class MotherOTPPage extends StatelessWidget {
  const MotherOTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _codeController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(context, 'Enter the code', '', false,  mother: true),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('The code was sent to your email', style: normalText.copyWith(fontSize: 15),),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text('Code', style: normalText.copyWith(fontSize: 15),),),
            CustomTextInput(
              textEditController: _codeController,
              hintTextString: 'Enter the code',
              inputType: InputType.Number,
              cornerRadius: 5,
              themeColor: lightPrimaryColor,
            ),
            const SizedBox(height: 10,),
            ButtonWidget(text: 'CONTINUE', press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MotherNewPassword())), BackgroundColor: primaryColor, radius: 4,),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
