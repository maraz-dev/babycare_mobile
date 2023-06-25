// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/common/widgets/authHeaderWidget.dart';
import 'package:hephzibah/common/widgets/button.dart';
import 'package:hephzibah/common/widgets/custom_text_input.dart';
import 'package:hephzibah/features/baby_care/presentation/cubit/signin/signin_cubit.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/mother_screens/auth/baby_reg.dart';
import 'package:hephzibah/features/baby_care/presentation/pages/ui/mother_screens/auth/signin.dart';

class MotherSignUp extends StatefulWidget {
  const MotherSignUp({Key? key}) : super(key: key);

  @override
  State<MotherSignUp> createState() => _MotherSignUpState();
}

class _MotherSignUpState extends State<MotherSignUp> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: authAppBar(
        context,
        'Sign Up',
        'Please enter your credentials to proceed',
        true,
        mother: true,
      ),
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BabyRegistration(
                          babyId: email,
                        )));
          }
          if (state is SigninFailure) {
            // errors.clear();
            // addError(error: "Invalid Login");
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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
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
                    padding: const EdgeInsets.symmetric(vertical: 5),
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
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Mobile Phone',
                      style: normalText.copyWith(fontSize: 15),
                    ),
                  ),
                  CustomTextInput(
                    textEditController: _phoneController,
                    hintTextString: 'Mobile Number ',
                    inputType: InputType.Default,
                    cornerRadius: 5,
                    themeColor: lightPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
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
                    press: () async {
                      setState(() {
                      });
                      email = _emailController.text.trim();
                      await BlocProvider.of<SigninCubit>(context)
                          .registerMother(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        name: _nameController.text.trim(),
                        phoneNumber: _phoneController.text.trim(),
                        babyId: email,
                      );

                      showLoadingIndicator();
                      // Future.delayed(const Duration(seconds: 5), () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => BabyRegistration(
                      //                 babyId: babyId,
                      //               )));
                      // });
                    },
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
          );
        },
      ),
    );
  }

  void showLoadingIndicator() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
