import 'package:flutter/material.dart';
import '../../../../../../../common/commons.dart';
import '../../../../../../../common/widgets/authHeaderWidget.dart';
import '../../../../../../../common/widgets/button.dart';
import '../../../../../../../common/widgets/custom_text_input.dart';
import 'new_password.dart';
class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _codeController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(context, 'Enter the code', '', false),
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
            ButtonWidget(text: 'CONTINUE', press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword())), BackgroundColor: primaryColor, radius: 4,),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
