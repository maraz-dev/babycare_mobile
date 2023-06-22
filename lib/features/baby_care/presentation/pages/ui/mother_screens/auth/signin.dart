import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../common/commons.dart';
import '../../../../../../../common/widgets/authHeaderWidget.dart';
import '../../../../../../../common/widgets/button.dart';
import '../../../../../../../common/widgets/custom_text_input.dart';
import '../../home_screen/home_page.dart';
import 'signup.dart';

import '../../../../cubit/signin/signin_cubit.dart';
import '../../default_home.dart';

class MotherSignIn extends StatefulWidget {
  const MotherSignIn({Key? key}) : super(key: key);

  @override
  State<MotherSignIn> createState() => _MotherSignInState();
}

class _MotherSignInState extends State<MotherSignIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(
          context, 'Sign In', 'Please enter your credentials to proceed', true,
          mother: true),
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DefaultHome()));
          }
        },
        builder: (context, state) {
           if (state is SigninLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Container(
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
                    press: () async {
                      await BlocProvider.of<SigninCubit>(context).submitSignin(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                    },
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
        },
      ),
    );
  }
}
